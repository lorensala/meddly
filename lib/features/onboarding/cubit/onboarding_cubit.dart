import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_cubit.freezed.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._repository) : super(const OnboardingState.initial());
  final AuthRepository _repository;

  Future<void> logInWithGoogle() async {
    if (state.isLoading) return;
    emit(const OnboardingState.loading());
    final result = await _repository.logInWithGoogle();

    result.fold(
      (failure) => emit(OnboardingState.error(failure)),
      (_) => emit(const OnboardingState.success()),
    );
  }
}
