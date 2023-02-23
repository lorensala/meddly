import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(TermsAndConditions.pure()) TermsAndConditions termsAndConditions,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _SignUpState;
}
