import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sex.freezed.dart';

/// {@template sex}
/// Sex input.
/// {@endtemplate}
class SexInput extends FormzInput<bool, SexError> {
  const SexInput.pure() : super.pure(true);

  /// {@macro sex}
  const SexInput.dirty({bool value = false}) : super.dirty(value);

  @override
  SexError? validator(bool value) {
    return null;
  }
}

/// {@template sex_error}
/// Sex error.
/// {@endtemplate}
@freezed
class SexError with _$SexError {
  /// {@macro sex_error}
  const factory SexError.invalid() = _Invalid;
}
