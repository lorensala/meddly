import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meddly/core/core.dart';
import 'package:user/user.dart';
import 'package:validators/validators.dart';

part 'setup_cubit.freezed.dart';
part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit(this._repository) : super(const SetupState());

  final UserRepository _repository;

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([
          name,
          state.lastname,
          state.height,
          state.weight,
          state.sex,
          state.birthdate,
          state.phoneNumber,
        ]),
      ),
    );
  }

  void lastnameChanged(String value) {
    final lastname = Lastname.dirty(value);
    emit(
      state.copyWith(
        lastname: lastname,
        status: Formz.validate([
          state.name,
          lastname,
          state.height,
          state.weight,
          state.sex,
          state.birthdate,
          state.phoneNumber,
        ]),
      ),
    );
  }

  void heightChanged(String value) {
    final height = Height.dirty(value);
    emit(
      state.copyWith(
        height: height,
        status: Formz.validate([
          state.name,
          state.lastname,
          height,
          state.weight,
          state.sex,
          state.birthdate,
          state.phoneNumber,
        ]),
      ),
    );
  }

  void weightChanged(String value) {
    final weight = Weight.dirty(value);
    emit(
      state.copyWith(
        weight: weight,
        status: Formz.validate([
          state.name,
          state.lastname,
          state.height,
          weight,
          state.sex,
          state.birthdate,
          state.phoneNumber,
        ]),
      ),
    );
  }

  void sexChanged({required bool value}) {
    final sex = SexInput.dirty(value: value);
    emit(
      state.copyWith(
        sex: sex,
        status: Formz.validate([
          state.name,
          state.lastname,
          state.height,
          state.weight,
          sex,
          state.birthdate,
          state.phoneNumber,
        ]),
      ),
    );
  }

  void birthdateChanged(String value) {
    final birthdate = Birthdate.dirty(value);
    emit(
      state.copyWith(
        birthdate: birthdate,
        status: Formz.validate([
          state.name,
          state.lastname,
          state.height,
          state.weight,
          state.sex,
          birthdate,
          state.phoneNumber,
        ]),
      ),
    );
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate([
          state.name,
          state.lastname,
          state.height,
          state.weight,
          state.sex,
          state.birthdate,
          phoneNumber,
        ]),
      ),
    );
  }

  Future<void> createAccount() async {
    if (state.status == FormzStatus.submissionInProgress) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final possibleFailureOrUserOrNull = _repository.getUser();

    if (possibleFailureOrUserOrNull.isLeft()) {
      return emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          failure:
              (possibleFailureOrUserOrNull as Left<UserFailure, User?>).value,
        ),
      );
    }

    final currentUserOrNull =
        (possibleFailureOrUserOrNull as Right<UserFailure, User?>).value;

    final editedUser = currentUserOrNull?.copyWith(
      firstName: state.name.value.capitalizeFullName.trim(),
      lastName: state.lastname.value.trim(),
      height: double.parse(state.height.value),
      weight: double.parse(state.weight.value),
      sex: state.sex.value ? const Sex.female() : const Sex.male(),
      birth: state.birthdate.value,
      phone: state.phoneNumber.value,
    );

    final possibleFailureOrUnit = await _repository.updateUser(editedUser!);

    possibleFailureOrUnit.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: failure,
        ),
      ),
      (_) => emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
        ),
      ),
    );
  }
}
