import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/splash/splash.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Stream<User> build() {
    return ref.watch(authRepositoryProvider).authStateChanges;
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final (err, _) = await ref
        .read(authRepositoryProvider)
        .logInWithEmailAndPassword(email: email, password: password);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err == null) {
      ref.read(goRouterProvider).go(SplashPage.routeName);
    } else {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
  }

  Future<void> logInWithGoogle() async {
    state = const AsyncLoading();

    final (err, isNotCancel) =
        await ref.read(authRepositoryProvider).logInWithGoogle();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err == null) {
      if (isNotCancel) {
        ref.read(goRouterProvider).go(SplashPage.routeName);
      }
    } else {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
  }

  Future<void> reigsterWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final (err, _) = await ref
        .read(authRepositoryProvider)
        .signUpWithEmailAndPassword(email: email, password: password);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err == null) {
      ref.read(goRouterProvider).go(SplashPage.routeName);
    } else {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    final (err, _) = await ref.read(authRepositoryProvider).signOut();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err == null) {
      ref.read(goRouterProvider).go(SplashPage.routeName);
    } else {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    state = const AsyncLoading();

    final (err, _) = await ref
        .read(authRepositoryProvider)
        .sendPasswordResetEmail(email: email);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
  }

  Future<void> deleteUser() async {
    state = const AsyncLoading();

    final (err, _) = await ref.read(authRepositoryProvider).delete();

    final l10n = ref.read(l10nProvider) as AppLocalizations;
    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
  }
}
