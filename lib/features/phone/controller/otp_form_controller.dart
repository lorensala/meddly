import 'package:meddly/features/phone/state/otp_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'otp_form_controller.g.dart';

@riverpod
class OtpFormController extends _$OtpFormController {
  @override
  OtpFormState build() {
    return OtpFormState();
  }

  void otpChanged(String value) {
    final otp = Otp.dirty(value);
    state = state.copyWith(
      otp: otp,
    );
  }
}
