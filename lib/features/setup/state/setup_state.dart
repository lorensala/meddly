import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'setup_state.freezed.dart';

@freezed
class SetupState with _$SetupState, FormzMixin {
  const factory SetupState({
    @Default(Name.pure()) Name name,
    @Default(Lastname.pure()) Lastname lastname,
    @Default(Height.pure()) Height height,
    @Default(Weight.pure()) Weight weight,
    @Default(SexInput.pure()) SexInput sex,
    @Default(Birthdate.pure()) Birthdate birthdate,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
  }) = _SetupState;

  const SetupState._();

  @override

  // ignore: strict_raw_type
  List<FormzInput> get inputs =>
      [name, lastname, height, weight, sex, birthdate];
}
