part of 'setup_cubit.dart';

@freezed
class SetupState with _$SetupState {
  const factory SetupState({
    @Default(Name.pure()) Name name,
    @Default(Lastname.pure()) Lastname lastname,
    @Default(Height.pure()) Height height,
    @Default(Weight.pure()) Weight weight,
    @Default(SexInput.pure()) SexInput sex,
    @Default(Birthdate.pure()) Birthdate birthdate,
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    @Default(FormzStatus.pure) FormzStatus status,
    UserFailure? failure,
  }) = _SetupState;
}
