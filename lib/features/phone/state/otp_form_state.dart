import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'otp_form_state.freezed.dart';

@freezed
class OtpFormState with _$OtpFormState {
  const factory OtpFormState({
    @Default(Otp.pure()) Otp otp,
  }) = _OtpFormState;
}
