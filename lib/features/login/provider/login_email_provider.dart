import 'package:meddly/features/login/controller/login_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'login_email_provider.g.dart';

@riverpod
Password loginPassword(LoginPasswordRef ref) {
  return ref.watch(loginControllerProvider).password;
}
