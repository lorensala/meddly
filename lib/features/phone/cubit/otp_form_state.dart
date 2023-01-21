part of 'otp_form_cubit.dart';

@freezed
class OtpFormState with _$OtpFormState {
  const factory OtpFormState({
    @Default(Otp.pure()) Otp otp,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _OtpFormState;
}
