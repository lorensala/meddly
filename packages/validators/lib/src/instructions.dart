import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'instructions.freezed.dart';

/// {@template instructions_error}
/// Form input validation error.
/// {@endtemplate}
@freezed
class InstructionsError with _$InstructionsError {
  /// {@macro instructions_error}
  const factory InstructionsError.invalid() = Invalid;

  /// {@macro instructions_error}
  const factory InstructionsError.tooLong() = TooLong;
}

/// {@template instructions}
/// Input for instructions.
/// {@endtemplate}
class Instructions extends FormzInput<String?, InstructionsError> {
  const Instructions.pure() : super.pure(null);

  /// {@macro instructions}
  const Instructions.dirty([super.value]) : super.dirty();

  static final RegExp _instructionRegExp = RegExp(
    r'''^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$''',
  );

  @override
  InstructionsError? validator(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return null;
    if (value.length > 100) return const InstructionsError.tooLong();
    if (!_instructionRegExp.hasMatch(value)) {
      return const InstructionsError.invalid();
    }
    return null;
  }
}
