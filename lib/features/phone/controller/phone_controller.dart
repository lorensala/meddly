import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/phone/state/phone_state.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_controller.g.dart';

@riverpod
class PhoneController extends _$PhoneController {
  @override
  PhoneState build() {
    return const PhoneState.initial();
  }

  String _verificationId = '';
  int? _forceResendingToken;

  int? get forceResendingToken => _forceResendingToken;

  Future<void> sendPhoneNumber() async {
    state = const PhoneState.sendingOtp();

    final authRepository = ref.read(authRepositoryProvider);
    final phoneNumber = ref.watch(phoneNumberProvider);
    final countryCode = ref.watch(countryCodeProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    final phoneNumberWithCountryCode =
        '${countryCode.code}${phoneNumber.value}';

    await authRepository.verifyPhoneNumber(
      phoneNumber: phoneNumberWithCountryCode,
      verificationCompleted: verificationCompleted,
      verificationFailed: (e) {
        final err = AuthException.fromFirebaseCode(e.code);
        state = PhoneState.error(err.describe(l10n));
      },
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        _forceResendingToken = forceResendingToken;

        state = const PhoneState.otpSent();
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;

        state = const PhoneState.otpSent();
      },
    );
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    final authRepository = ref.read(authRepositoryProvider);
    final userRepository = ref.read(userRepositoryProvider);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final phoneNumber = ref.watch(phoneNumberProvider);
    final countryCode = ref.watch(countryCodeProvider);
    final phoneNumberWithCountryCode =
        '${countryCode.code}${phoneNumber.value}';

    final (err, _) = await authRepository.updatePhoneNumber(
      phoneNumber: phoneNumberWithCountryCode,
      verificationId: _verificationId,
    );

    if (err != null) {
      state = PhoneState.error(err.describe(l10n));
      return;
    }

    final userOrFailure = userRepository.getUser();

    if (userOrFailure.isLeft()) {
      state = PhoneState.error(userOrFailure.asLeft().message(l10n));

      return;
    }

    final user = userOrFailure.asRight();

    if (user == null) {
      state = PhoneState.error(l10n.userNotFound);
      return;
    }

    final userWithPhoneNumber = user.copyWith(
      phone: phoneNumberWithCountryCode,
    );

    final res2 = await userRepository.updateUser(userWithPhoneNumber);

    res2.fold(
      (l) => state = PhoneState.error(l.message(l10n)),
      (r) => state = const PhoneState.otpVerified(),
    );
  }

  Future<void> verifyPhone(String smsCode) {
    state = const PhoneState.verifyingOtp();
    final phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );

    return verificationCompleted(phoneAuthCredential);
  }
}
