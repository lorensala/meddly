import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());
  final AuthRepository _authenticationRepository;

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  void obscurePasswordChanged() {
    emit(
      state.copyWith(
        obscurePassword: !state.obscurePassword,
      ),
    );
  }

  Future<void> logInWithEmailAndPassword() async {
    if (state.status.isSubmissionInProgress) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await _authenticationRepository.logInWithEmailAndPassword(
      email: state.email.value.trim().toLowerCase(),
      password: state.password.value.trim(),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: failure,
        ),
      ),
      (_) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
    );
  }
}
