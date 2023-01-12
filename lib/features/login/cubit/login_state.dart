part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    AuthFailure? failure,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(true) bool obscurePassword,
  }) = _LoginState;
}
