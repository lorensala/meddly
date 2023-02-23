import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _LoginState;
}
