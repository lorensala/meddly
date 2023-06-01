import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/features/splash/widgets/splash_body.dart';
import 'package:meddly/features/user/user.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String routeName = '/';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashView(),
    );
  }
}

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(userExistProvider);
      ref.watch(localNotificationServiceProvider);
      ref.watch(firebaseMessagingServiceProvider);
    });

    return const SplashBody();
  }
}
