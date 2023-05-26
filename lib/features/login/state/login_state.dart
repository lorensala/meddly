import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState, FormzMixin {
  const factory LoginState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
  }) = _LoginState;

  const LoginState._();

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [email, password];
}
