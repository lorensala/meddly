import 'package:meddly/features/sign_up/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'sign_up_email_provider.g.dart';

@riverpod
Email signUpEmail(SignUpEmailRef ref) {
  return ref.watch(signUpControllerProvider).email;
}
