import 'package:formz/formz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/state/state.dart';
import 'package:meddly/features/user/controller/user_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';
import 'package:validators/validators.dart';

part 'setup_controller.g.dart';

@riverpod
class SetupController extends _$SetupController {
  @override
  SetupState build() {
    return const SetupState();
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    state = state.copyWith(
      name: name,
      status: Formz.validate([
        name,
        state.lastname,
        state.height,
        state.weight,
        state.sex,
        state.birthdate,
      ]),
    );
  }

  void lastnameChanged(String value) {
    final lastname = Lastname.dirty(value);
    state = state.copyWith(
      lastname: lastname,
      status: Formz.validate([
        state.name,
        lastname,
        state.height,
        state.weight,
        state.sex,
        state.birthdate,
      ]),
    );
  }

  void heightChanged(String value) {
    if (value.isEmpty) {
      const height = Height.pure();
      state = state.copyWith(
        height: height,
        status: Formz.validate([
          state.name,
          state.lastname,
          height,
          state.weight,
          state.sex,
          state.birthdate,
        ]),
      );
    } else {
      final height = Height.dirty(value);
      state = state.copyWith(
        height: height,
        status: Formz.validate([
          state.name,
          state.lastname,
          height,
          state.weight,
          state.sex,
          state.birthdate,
        ]),
      );
    }
  }

  void weightChanged(String value) {
    if (value.isEmpty) {
      const weight = Weight.pure();
      state = state.copyWith(
        weight: weight,
        status: Formz.validate([
          state.name,
          state.lastname,
          state.height,
          weight,
          state.sex,
          state.birthdate,
        ]),
      );
    } else {
      final weight = Weight.dirty(value);
      state = state.copyWith(
        weight: weight,
        status: Formz.validate([
          state.name,
          state.lastname,
          state.height,
          weight,
          state.sex,
          state.birthdate,
        ]),
      );
    }
  }

  void sexChanged({required bool value}) {
    final sex = SexInput.dirty(value: value);
    state = state.copyWith(
      sex: sex,
      status: Formz.validate([
        state.name,
        state.lastname,
        state.height,
        state.weight,
        sex,
        state.birthdate,
      ]),
    );
  }

  void birthdateChanged(String value) {
    final birthdate = Birthdate.dirty(value);
    state = state.copyWith(
      birthdate: birthdate,
      status: Formz.validate([
        state.name,
        state.lastname,
        state.height,
        state.weight,
        state.sex,
        birthdate,
      ]),
    );
  }

  void save() {
    final newUser = User(
      uid: '',
      email: '',
      firstName: state.name.value.capitalize().trim(),
      lastName: state.lastname.value.trim(),
      birth: state.birthdate.value,
      sex: state.sex.value ? const Sex.female() : const Sex.male(),
      height: double.tryParse(state.height.value),
      weight: double.tryParse(state.weight.value),
    );

    ref.read(userControllerProvider.notifier).createUser(newUser);
  }
}
