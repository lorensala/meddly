import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_repository/firebase_auth_repository.dart';
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
    final phoneNumber =
        ref.watch(phoneFormControllerProvider.select((s) => s.phoneNumber));
    final countryCode =
        ref.watch(phoneFormControllerProvider.select((s) => s.countryCode));
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

    final phoneNumber =
        ref.watch(phoneFormControllerProvider.select((s) => s.phoneNumber));
    final countryCode =
        ref.watch(phoneFormControllerProvider.select((s) => s.countryCode));
    final phoneNumberWithCountryCode =
        '${countryCode.code}${phoneNumber.value}';

    final (phoneErr, _) =
        await authRepository.linkWithCredential(credential: credential);

    if (phoneErr != null) {
      state = PhoneState.error(phoneErr.describe(l10n));
      return;
    }

    final (cacheError, cachedUser) = userRepository.getUser();

    if (cacheError != null) {
      state = PhoneState.error(cacheError.describe(l10n));

      return;
    }

    if (cachedUser == null) {
      state = PhoneState.error(l10n.userNotFound);
      return;
    }

    final userWithPhoneNumber = cachedUser.copyWith(
      phone: phoneNumberWithCountryCode,
    );

    final (updateErr, _) = await userRepository.updateUser(userWithPhoneNumber);

    if (updateErr != null) {
      state = PhoneState.error(updateErr.describe(l10n));
    } else {
      state = const PhoneState.otpVerified();
    }
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
