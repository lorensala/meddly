import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());
  final AuthRepository _authenticationRepository;

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status:
            Formz.validate([email, state.password, state.termsAndConditions]),
      ),
    );
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status:
            Formz.validate([state.email, password, state.termsAndConditions]),
      ),
    );
  }

  void onTermsAcceptedChanged({required bool value}) {
    final termsAndConditions = TermsAndConditions.dirty(value: value);
    emit(
      state.copyWith(
        termsAndConditions: termsAndConditions,
        status:
            Formz.validate([state.email, state.password, termsAndConditions]),
      ),
    );
  }

  Future<void> signUp() async {
    if (!state.status.isValid) return;
    if (state.status.isSubmissionInProgress) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await _authenticationRepository.registerWithEmailAndPassword(
      email: state.email.value,
      password: state.password.value,
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
