import 'package:meddly/features/sign_up/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'terms_and_conditions_provider.g.dart';

@riverpod
TermsAndConditions termsAndConditions(TermsAndConditionsRef ref) {
  return ref.watch(signUpControllerProvider).termsAndConditions;
}
