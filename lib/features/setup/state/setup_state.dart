import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'setup_state.freezed.dart';

@freezed
class SetupState with _$SetupState {
  const factory SetupState({
    @Default(Name.pure()) Name name,
    @Default(Lastname.pure()) Lastname lastname,
    @Default(Height.pure()) Height height,
    @Default(Weight.pure()) Weight weight,
    @Default(SexInput.pure()) SexInput sex,
    @Default(Birthdate.pure()) Birthdate birthdate,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _SetupState;
}
