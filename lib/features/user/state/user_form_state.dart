import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'user_form_state.freezed.dart';

@freezed
class UserFormState with _$UserFormState, FormzMixin {
  const factory UserFormState({
    @Default(Email.pure()) Email email,
    @Default(Name.pure()) Name name,
    @Default(Lastname.pure()) Lastname lastname,
    @Default(Height.pure()) Height height,
    @Default(Weight.pure()) Weight weight,
    @Default(SexInput.pure()) SexInput sex,
    @Default(Birthdate.pure()) Birthdate birthdate,
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    @Default(false) bool isEditing,
  }) = _UserFormState;

  const UserFormState._();

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs =>
      [email, name, lastname, height, weight, sex, birthdate];
}
