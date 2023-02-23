import 'package:formz/formz.dart';
import 'package:meddly/features/setup/cubit/setup_cubit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  void weightChanged(String value) {
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
    // save user login
    // ref.watch(userControllerProvider.notifier).createUser(user);
  }
}
