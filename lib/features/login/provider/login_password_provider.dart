import 'package:meddly/features/login/controller/login_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'login_password_provider.g.dart';

@riverpod
Email loginEmail(LoginEmailRef ref) {
  return ref.watch(loginControllerProvider).email;
}
