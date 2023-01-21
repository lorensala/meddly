part of 'phone_bloc.dart';

@freezed
class PhoneEvent with _$PhoneEvent {
  const factory PhoneEvent.sendPhoneNumber({
    required String phoneNumber,
    int? forceResendingToken,
  }) = _SendPhoneNumber;

  const factory PhoneEvent.verifyPhoneNumber({
    required String verificationId,
    required String smsCode,
  }) = _VerifyPhoneNumber;

  const factory PhoneEvent.verificationCompleted({
    required PhoneAuthCredential phoneAuthCredential,
  }) = _VerificationCompleted;

  const factory PhoneEvent.verificationFailed({
    required FirebaseAuthException firebaseAuthException,
  }) = _VerificationFailed;

  const factory PhoneEvent.codeSent({
    required String verificationId,
    required int? forceResendingToken,
  }) = _CodeSent;

  const factory PhoneEvent.codeAutoRetrievalTimeout({
    required String verificationId,
  }) = _CodeAutoRetrievalTimeout;
}
