import 'package:authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/provider/l10n_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_controller.g.dart';

@riverpod
class PhoneController extends _$PhoneController {
  @override
  FutureOr<void> build() {}

  final verificationId = '';

  Future<void> sendPhoneNumber() async {
    final authRepository = ref.read(authRepositoryProvider);
    final phoneNumber = ref.watch(phoneNumberProvider);
    final countryCode = ref.watch(countryCodeProvider);
    final l10n = ref.watch(l10nProvider);

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
        verificationId = verificationId;
        forceResendingToken = forceResendingToken;

        state = AsyncLoading();
      },
      codeAutoRetrievalTimeout: (verificationId) {
        verificationId = verificationId;

        state = AsyncLoading();
      },
    );
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    final authRepository = ref.read(authRepositoryProvider);
    final l10n = ref.read(l10nProvider);
    final phoneNumber = ref.watch(phoneNumberProvider);
    final countryCode = ref.watch(countryCodeProvider);
    final user = ref.watch(userProvider);

    final res = await authRepository.updatePhoneNumber(credential);
    final phoneNumberWithCountryCode =
        '${countryCode.code}${phoneNumber.value}';

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }

    if (user.isNone()) {
      state = AsyncError(l10n.userNotFound, StackTrace.current);
    }

    final userWithPhoneNumber = user.asSome().copyWith(
          phone: phoneNumberWithCountryCode,
        );

    ref.read(userControllerProvider.notifier).updateUser(userWithPhoneNumber);
  }

  Future<void> verifyPhone(String smsCode) {
    final phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    return verificationCompleted(phoneAuthCredential);
  }
}
