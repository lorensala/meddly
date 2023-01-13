part of 'onboarding_cubit.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _Initial;
  const factory OnboardingState.loading() = _Loading;
  const factory OnboardingState.success() = _Success;
  const factory OnboardingState.error(AuthFailure failure) = _Error;

  const OnboardingState._();

  bool get isLoading => this is _Loading;
}
