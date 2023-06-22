import 'package:meddly/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'user_form_controller.g.dart';

@riverpod
class UserFormController extends _$UserFormController {
  @override
  UserFormState build() {
    final user = ref.watch(userProvider);

    if (user != null) {
      return UserFormState(
        email: Email.dirty(user.email),
        name: Name.dirty(user.firstName),
        lastname: Lastname.dirty(user.lastName),
        height: Height.dirty(user.height.toString()),
        weight: Weight.dirty(user.weight.toString()),
        sex: SexInput.dirty(
          value: user.sex.when(male: () => false, female: () => true),
        ),
        birthdate: Birthdate.dirty(user.birth.toString()),
        phoneNumber: PhoneNumber.dirty(user.phone),
      );
    }

    return const UserFormState();
  }

  void isEditingChange() {
    state = state.copyWith(isEditing: !state.isEditing);
  }

  void emailChange(String email) {
    state = state.copyWith(email: Email.dirty(email));
  }

  void nameChange(String name) {
    state = state.copyWith(name: Name.dirty(name));
  }

  void lastnameChange(String lastname) {
    state = state.copyWith(lastname: Lastname.dirty(lastname));
  }

  void heightChange(String height) {
    state = state.copyWith(height: Height.dirty(height));
  }

  void weightChange(String weight) {
    state = state.copyWith(weight: Weight.dirty(weight));
  }

  void save() {
    final user = ref.watch(userProvider);

    final editedUser = user?.copyWith(
      email: state.email.value,
      firstName: state.name.value,
      lastName: state.lastname.value,
      height: double.tryParse(state.height.value),
      weight: double.tryParse(state.weight.value),
    );
    if (editedUser != null) {
      ref.read(userControllerProvider.notifier).updateUser(editedUser);
    }
  }
}
