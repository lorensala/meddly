import 'package:formz/formz.dart';

enum InvitationCodeError { invalid }

class InvitationCode extends FormzInput<String, InvitationCodeError> {
  const InvitationCode.pure() : super.pure('');

  const InvitationCode.dirty([super.value = '']) : super.dirty();

  static final RegExp _codeRegExp =
      RegExp(r'^[A-Z0-9]{3}-[A-Z0-9]{4}-[A-Z0-9]{3}$');

  @override
  InvitationCodeError? validator(String value) {
    if (!_codeRegExp.hasMatch(value)) {
      return InvitationCodeError.invalid;
    }

    return null;
  }
}
