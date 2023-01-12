import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'forgot_password_cubit.freezed.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._authenticationRepository)
      : super(const ForgotPasswordState());
  final AuthRepository _authenticationRepository;

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(email: email, status: Formz.validate([email])));
  }

  Future<void> sendPasswordResetEmail() async {
    if (state.status.isSubmissionInProgress) return;
    if (state.status.isInvalid) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await _authenticationRepository.sendPasswordResetEmail(
      email: state.email.value,
    );

    emit(
      result.fold(
        (failure) => state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: failure,
        ),
        (_) => state.copyWith(status: FormzStatus.submissionSuccess),
      ),
    );
  }
}
