import 'package:formz/formz.dart';

enum OtpError { invalid }

class Otp extends FormzInput<String, OtpError> {
  const Otp.pure() : super.pure('');

  const Otp.dirty([super.value = '']) : super.dirty();

  static final RegExp _otpRegExp = RegExp(r'^[0-9]{6}$');

  @override
  OtpError? validator(String value) {
    return _otpRegExp.hasMatch(value) ? null : OtpError.invalid;
  }
}
