part of 'phone_bloc.dart';

@freezed
class PhoneState with _$PhoneState {
  const factory PhoneState.initial() = _Initial;
  const factory PhoneState.loading() = _Loading;
  const factory PhoneState.codeSentSuccess({
    required String verificationId,
    int? forceResendingToken,
  }) = _CodeSentSuccess;
  const factory PhoneState.verificated() = _Verificated;
  const factory PhoneState.error({
    required String verificationId,
    required AuthFailure failure,
  }) = _Error;

  const PhoneState._();

  bool get isLoading => this is _Loading;
}
