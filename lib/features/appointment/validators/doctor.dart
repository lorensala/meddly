import 'package:formz/formz.dart';

enum DoctorValidationError { invalid }

class Doctor extends FormzInput<String?, DoctorValidationError> {
  const Doctor.pure() : super.pure('');
  const Doctor.dirty([String super.value = '']) : super.dirty();

  static final RegExp _dcotorRegExp = RegExp(
    r'''^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$''',
  );

  @override
  DoctorValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!_dcotorRegExp.hasMatch(value)) {
      return DoctorValidationError.invalid;
    }

    return null;
  }
}
