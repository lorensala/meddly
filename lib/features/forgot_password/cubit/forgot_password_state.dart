part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(Email.pure()) Email email,
    @Default(FormzStatus.pure) FormzStatus status,
    AuthFailure? failure,
  }) = _ForgotPasswordState;
}
