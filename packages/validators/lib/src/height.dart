import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'height.freezed.dart';

class Height extends FormzInput<String, HeigthError> {
  const Height.pure() : super.pure('');

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

@freezed
class HeigthError with _$HeigthError {
  const factory HeigthError.negative() = _Negative;

  const factory HeigthError.invalid() = _Invalid;

  const factory HeigthError.zero() = _Zero;

  const factory HeigthError.empty() = _Empty;
}
