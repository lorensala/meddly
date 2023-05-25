import 'package:meddly/features/phone/controller/phone_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'phone_form_provider.g.dart';

@riverpod
PhoneNumber phoneNumber(PhoneNumberRef ref) {
  return ref.watch(phoneFormControllerProvider).phoneNumber;
}

@riverpod
CountryCode countryCode(CountryCodeRef ref) {
  return ref.watch(phoneFormControllerProvider).countryCode;
}

@riverpod
bool isPhoneNumberValid(IsPhoneNumberValidRef ref) {
  return ref.watch(phoneNumberProvider).valid;
}

@riverpod
String? phoneNumberErrorText(PhoneNumberErrorTextRef ref) {
  return null;
}
