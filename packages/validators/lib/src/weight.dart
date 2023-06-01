import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight.freezed.dart';

class Weight extends FormzInput<String, WeightError> {
  const Weight.pure() : super.pure('');

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

@freezed
class WeightError with _$WeightError {
  const factory WeightError.negative() = _Negative;

  const factory WeightError.invalid() = _Invalid;

  const factory WeightError.zero() = _Zero;

  const factory WeightError.empty() = _Empty;
}
