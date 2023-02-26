import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(Email.pure()) Email email,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _ForgotPasswordState;
}
