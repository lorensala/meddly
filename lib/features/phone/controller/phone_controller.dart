import 'package:authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_controller.g.dart';

@riverpod
class PhoneController extends _$PhoneController {
  //! TODO(lorenzo): change to PhoneState that contains a state called CodeSent()
  //! because im unabled to show the Loading state when the button is pressed
  @override
  FutureOr<void> build() {}

  String _verificationId = '';
  int? _forceResendingToken;

  int? get forceResendingToken => _forceResendingToken;

  Future<void> sendPhoneNumber() async {
    final authRepository = ref.read(authRepositoryProvider);
    final phoneNumber = ref.watch(phoneNumberProvider);
    final countryCode = ref.watch(countryCodeProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    final phoneNumberWithCountryCode =
        '${countryCode.code}${phoneNumber.value}';

    await authRepository.verifyPhone(
      phoneNumber: phoneNumberWithCountryCode,
      verificationCompleted: verificationCompleted,
      verificationFailed: (e) {
        final failure = AuthFailure.fromCode(e.code);
        state = AsyncError(failure.message(l10n), StackTrace.current);
      },
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        _forceResendingToken = forceResendingToken;

        state = AsyncLoading();
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;

        state = AsyncLoading();
      },
    );
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    final authRepository = ref.read(authRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final phoneNumber = ref.watch(phoneNumberProvider);
    final countryCode = ref.watch(countryCodeProvider);
    final user = ref.watch(userProvider);
    final userRepository = ref.read(userRepositoryProvider);

    final res = await authRepository.updatePhoneNumber(credential);
    final phoneNumberWithCountryCode =
        '${countryCode.code}${phoneNumber.value}';

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
      return;
    }

    if (user.isNone()) {
      state = AsyncError(l10n.userNotFound, StackTrace.current);
      return;
    }

    final userWithPhoneNumber = user.asSome().copyWith(
          phone: phoneNumberWithCountryCode,
        );

    final res2 = await userRepository.updateUser(userWithPhoneNumber);

    state = res2.fold(
      (l) => state = AsyncError(l.message(l10n), StackTrace.current),
      (r) => state = AsyncData(userWithPhoneNumber),
    );
  }

  Future<void> verifyPhone(String smsCode) {
    final phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );

    return verificationCompleted(phoneAuthCredential);
  }
}
