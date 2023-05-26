import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState, FormzMixin {
  const factory ForgotPasswordState({
    @Default(Email.pure()) Email email,
  }) = _ForgotPasswordState;

  const ForgotPasswordState._();

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [email];
}
