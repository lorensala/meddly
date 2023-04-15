import 'package:formz/formz.dart';
import 'package:meddly/features/sign_up/sign_up.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_sign_up_form_valid.g.dart';

@riverpod
bool isSignUpFormValid(IsSignUpFormValidRef ref) {
  return ref.watch(signUpControllerProvider).status.isValid;
}
