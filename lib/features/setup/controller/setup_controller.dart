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
    );
  }

  void lastnameChanged(String value) {
    final lastname = Lastname.dirty(value);
    state = state.copyWith(
      lastname: lastname,
    );
  }

  void heightChanged(String value) {
    if (value.isEmpty) {
      const height = Height.pure();
      state = state.copyWith(
        height: height,
      );
    } else {
      final height = Height.dirty(value);
      state = state.copyWith(
        height: height,
      );
    }
  }

  void weightChanged(String value) {
    if (value.isEmpty) {
      const weight = Weight.pure();
      state = state.copyWith(
        weight: weight,
      );
    } else {
      final weight = Weight.dirty(value);
      state = state.copyWith(
        weight: weight,
      );
    }
  }

  void sexChanged({required bool value}) {
    final sex = SexInput.dirty(value: value);
    state = state.copyWith(
      sex: sex,
    );
  }

  void birthdateChanged(String value) {
    final birthdate = Birthdate.dirty(value);
    state = state.copyWith(
      birthdate: birthdate,
    );
  }

  void save() {
    if (state.isNotValid) return;

    final newUser = User(
      uid: '',
      email: '',
      firstName: state.name.value.capitalize().trim(),
      lastName: state.lastname.value.trim(),
      birth: DateTime.tryParse(state.birthdate.value),
      sex: state.sex.value ? const Sex.female() : const Sex.male(),
      height: double.tryParse(state.height.value),
      weight: double.tryParse(state.weight.value),
    );

    ref.read(userControllerProvider.notifier).createUser(newUser);
  }
}
