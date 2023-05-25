import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'height.freezed.dart';

/// {@template height}
/// Height input.
/// {@endtemplate}
class Height extends FormzInput<String, HeigthError> {
  /// {@macro height}
  const Height.pure() : super.pure('');

  /// {@macro height}
  const Height.dirty([super.value = '']) : super.dirty();

  @override
  HeigthError? validator(String value) {
    if (value.isEmpty) return const HeigthError.empty();
    if (double.tryParse(value) == null) return const HeigthError.invalid();
    if (double.parse(value).isNegative) return const HeigthError.negative();
    if (double.parse(value) == 0.0) return const HeigthError.zero();
    return null;
  }
}

/// {@template height_error}
/// Height error.
/// {@endtemplate}
@freezed
class HeigthError with _$HeigthError {
  /// {@macro height_error}
  const factory HeigthError.negative() = _Negative;

  /// {@macro height_error}
  const factory HeigthError.invalid() = _Invalid;

  /// {@macro height_error}
  const factory HeigthError.zero() = _Zero;

  /// {@macro height_error}
  const factory HeigthError.empty() = _Empty;
}
