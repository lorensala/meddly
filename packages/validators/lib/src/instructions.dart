import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'instructions.freezed.dart';

@freezed
class InstructionsError with _$InstructionsError {
  const factory InstructionsError.invalid() = Invalid;

  const factory InstructionsError.tooLong() = TooLong;
}

class Instructions extends FormzInput<String?, InstructionsError> {
  const Instructions.pure() : super.pure(null);

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
