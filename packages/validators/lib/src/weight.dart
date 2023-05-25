import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight.freezed.dart';

/// {@template weight}
/// Weight input.
/// {@endtemplate}
class Weight extends FormzInput<String, WeightError> {
  /// {@macro weight}
  const Weight.pure() : super.pure('');

  /// {@macro weight}
  const Weight.dirty([super.value = '']) : super.dirty();

  @override
  WeightError? validator(String value) {
    if (value.isEmpty) return const WeightError.empty();
    if (double.tryParse(value) == null) return const WeightError.invalid();
    if (double.parse(value).isNegative) return const WeightError.negative();
    if (double.parse(value) == 0.0) return const WeightError.zero();
    return null;
  }
}

/// {@template weight_error}
/// Weight error.
/// {@endtemplate}
@freezed
class WeightError with _$WeightError {
  /// {@macro weight_error}
  const factory WeightError.negative() = _Negative;

  /// {@macro weight_error}
  const factory WeightError.invalid() = _Invalid;

  /// {@macro weight_error}
  const factory WeightError.zero() = _Zero;

  /// {@macro weight_error}
  const factory WeightError.empty() = _Empty;
}
