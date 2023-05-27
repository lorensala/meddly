import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sex.freezed.dart';

class SexInput extends FormzInput<bool, SexError> {
  const SexInput.pure() : super.pure(true);

  const SexInput.dirty({bool value = false}) : super.dirty(value);

  @override
  SexError? validator(bool value) {
    return null;
  }
}

@freezed
class SexError with _$SexError {
  const factory SexError.invalid() = _Invalid;
}
