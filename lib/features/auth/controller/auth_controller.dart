import 'package:meddly/features/auth/core/core.dart';
import 'package:meddly/features/auth/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final res = await ref
        .read(authRepositoryProvider)
        .logInWithEmailAndPassword(email: email, password: password);

    final l10n = ref.read(l10nProvider);

    state = res.fold(
      (err) => AsyncError(err.message(l10n), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> logInWithGoogle() async {
    state = const AsyncLoading();

    final res = await ref.read(authRepositoryProvider).logInWithGoogle();

    final l10n = ref.read(l10nProvider);

    state = res.fold(
      (err) => AsyncError(err.message(l10n), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> reigsterWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final res = await ref
        .read(authRepositoryProvider)
        .registerWithEmailAndPassword(email: email, password: password);

    final l10n = ref.read(l10nProvider);

    state = res.fold(
      (err) => AsyncError(err.message(l10n), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    final res = await ref.read(authRepositoryProvider).signOut();

    final l10n = ref.read(l10nProvider);

    state = res.fold(
      (err) => AsyncError(err.message(l10n), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    state = const AsyncLoading();

    final res = await ref
        .read(authRepositoryProvider)
        .sendPasswordResetEmail(email: email);

    final l10n = ref.read(l10nProvider);

    state = res.fold(
      (err) => AsyncError(err.message(l10n), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> deleteUser() async {
    state = const AsyncLoading();

    final res = await ref.read(authRepositoryProvider).deleteUser();

    final l10n = ref.read(l10nProvider);

    state = res.fold(
      (err) => AsyncError(err.message(l10n), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }
}
