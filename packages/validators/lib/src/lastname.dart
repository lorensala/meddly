import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lastname.freezed.dart';

class Lastname extends FormzInput<String, LastnameError> {
  const Lastname.pure() : super.pure('');

  const Lastname.dirty([super.value = '']) : super.dirty();

  static final RegExp _nameRegExp = RegExp(
    r'''^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$''',
  );

  @override
  LastnameError? validator(String value) {
    if (value.isEmpty) {
      return const LastnameError.empty();
    }

    if (value.length > 50) {
      return const LastnameError.tooLong();
    }

    if (!_nameRegExp.hasMatch(value)) {
      return const LastnameError.invalid();
    }

    return null;
  }
}

@freezed
class LastnameError with _$LastnameError {
  const factory LastnameError.invalid() = InvalidLastnameError;

  const factory LastnameError.tooLong() = TooLongLastnameError;

  const factory LastnameError.empty() = EmptyLastnameError;
}
