import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'name.freezed.dart';

class Name extends FormzInput<String, NameError> {
  const Name.pure() : super.pure('');

  const Name.dirty([super.value = '']) : super.dirty();

  static final RegExp _nameRegExp = RegExp(
    r'''^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$''',
  );

  @override
  NameError? validator(String value) {
    if (value.isEmpty) {
      return const NameError.empty();
    }

    if (value.length > 50) {
      return const NameError.tooLong();
    }

    if (!_nameRegExp.hasMatch(value)) {
      return const NameError.invalid();
    }

    return null;
  }
}

@freezed
class NameError with _$NameError {
  const factory NameError.invalid() = InvalidNameError;

  const factory NameError.tooLong() = TooLongNameError;

  const factory NameError.empty() = EmptyNameError;
}
