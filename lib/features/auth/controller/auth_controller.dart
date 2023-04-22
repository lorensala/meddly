import 'package:firebase_auth/firebase_auth.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/splash/splash.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Stream<User?> build() {
    return ref.watch(authRepositoryProvider).user;
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final res = await ref
        .read(authRepositoryProvider)
        .logInWithEmailAndPassword(email: email, password: password);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (res.isRight()) {
      ref.read(goRouterProvider).go(SplashPage.routeName);
    }

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }
  }

  Future<void> logInWithGoogle() async {
    state = const AsyncLoading();

    final res = await ref.read(authRepositoryProvider).logInWithGoogle();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (res.isRight()) {
      if (res.asRight()) {
        ref.read(goRouterProvider).go(SplashPage.routeName);
      } else {
        state = const AsyncData(null);
      }
    }

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }
  }

  Future<void> reigsterWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    final res = await ref
        .read(authRepositoryProvider)
        .registerWithEmailAndPassword(email: email, password: password);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (res.isRight()) {
      ref.read(goRouterProvider).go(SplashPage.routeName);
    }

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    final res = await ref.read(authRepositoryProvider).signOut();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (res.isRight()) {
      ref.read(goRouterProvider).go(SplashPage.routeName);
    }

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    state = const AsyncLoading();

    final res = await ref
        .read(authRepositoryProvider)
        .sendPasswordResetEmail(email: email);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }
  }

  Future<void> deleteUser() async {
    state = const AsyncLoading();

    final res = await ref.read(authRepositoryProvider).deleteUser();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }
  }
}
