import 'package:formz/formz.dart';

/// {@template otp_error}
/// Otp input error.
/// {@endtemplate}
enum OtpError {
  /// {@macro otp_error}
  invalid
}

/// {@template otp}
/// Input for otp.
/// {@endtemplate}
class Otp extends FormzInput<String, OtpError> {
  const Otp.pure() : super.pure('');

  /// {@macro otp}
  const Otp.dirty([super.value = '']) : super.dirty();

  static final RegExp _otpRegExp = RegExp(r'^[0-9]{6}$');

  @override
  OtpError? validator(String value) {
    return _otpRegExp.hasMatch(value) ? null : OtpError.invalid;
  }
}
