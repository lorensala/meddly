import 'package:meddly/features/sign_up/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'sign_up_password_provider.g.dart';

@riverpod
Password signUpPassword(SignUpPasswordRef ref) {
  return ref.watch(signUpControllerProvider).password;
}
