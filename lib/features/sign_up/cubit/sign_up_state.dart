part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(TermsAndConditions.pure()) TermsAndConditions termsAndConditions,
    AuthFailure? failure,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(true) bool obscurePassword,
  }) = _SignUpState;
}
