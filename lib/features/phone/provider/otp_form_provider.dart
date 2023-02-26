import 'package:meddly/features/phone/controller/otp_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'otp_form_provider.g.dart';

@riverpod
Otp otp(OtpRef ref) {
  return ref.watch(otpFormControllerProvider).otp;
}

@riverpod
bool isOtpValid(IsOtpValidRef ref) {
  return ref.watch(otpFormControllerProvider).otp.valid;
}
