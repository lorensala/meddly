import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState, FormzMixin {
  const factory SignUpState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(TermsAndConditions.pure()) TermsAndConditions termsAndConditions,
  }) = _SignUpState;

  const SignUpState._();

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [email, password, termsAndConditions];
}
