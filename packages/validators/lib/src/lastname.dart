import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lastname.freezed.dart';

/// {@template lastname}
/// Input for lastname.
/// {@endtemplate}
class Lastname extends FormzInput<String, LastnameError> {
  const Lastname.pure() : super.pure('');

  /// {@macro lastname}
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

/// {@template lastname_error}
/// Lastname input error.
/// {@endtemplate}
@freezed
class LastnameError with _$LastnameError {
  /// {@macro lastname_error}
  const factory LastnameError.invalid() = InvalidLastnameError;

  /// {@macro lastname_error}
  const factory LastnameError.tooLong() = TooLongLastnameError;

  /// {@macro lastname_error}
  const factory LastnameError.empty() = EmptyLastnameError;
}
