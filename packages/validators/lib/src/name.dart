import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'name.freezed.dart';

/// {@template name}
/// Input for name.
/// {@endtemplate}
class Name extends FormzInput<String, NameError> {
  const Name.pure() : super.pure('');

  /// {@macro name}
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

/// {@template name_error}
/// Name input error.
/// {@endtemplate}
@freezed
class NameError with _$NameError {
  /// {@macro name_error}
  const factory NameError.invalid() = InvalidNameError;

  /// {@macro name_error}
  const factory NameError.tooLong() = TooLongNameError;

  /// {@macro name_error}
  const factory NameError.empty() = EmptyNameError;
}
