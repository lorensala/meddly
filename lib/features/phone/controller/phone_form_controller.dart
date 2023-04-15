import 'package:meddly/features/phone/state/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'phone_form_controller.g.dart';

@riverpod
class PhoneFormController extends _$PhoneFormController {
  @override
  PhoneFormState build() {
    return const PhoneFormState();
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    state = state.copyWith(
      phoneNumber: phoneNumber,
    );
  }

  void countryCodeChanged(CountryCode? value) {
    if (value == null) {
      return;
    }
    state = state.copyWith(
      countryCode: value,
    );
  }
}
