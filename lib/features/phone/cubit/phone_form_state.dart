part of 'phone_form_cubit.dart';

@freezed
class PhoneFormState with _$PhoneFormState {
  const factory PhoneFormState({
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(CountryCode.AR) CountryCode countryCode,
    AuthFailure? failure,
  }) = _PhoneFormState;
}
