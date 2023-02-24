import 'package:meddly/features/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  @override
  ForgotPasswordState build() {
    return const ForgotPasswordState();
  }
}
