import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupSuccessPage extends StatelessWidget {
  const SetupSuccessPage({super.key});

  static const String routeName = '/setup/success';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SetupSuccessPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.setup),
      ),
      body: const SetupSuccessBody(),
    );
  }
}

class SetupSuccessBody extends ConsumerWidget {
  const SetupSuccessBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userControllerProvider);

    ref.listen(userControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) => showSnackBar(context, err.toString()),
      );
    });

    return state.when(
      data: (user) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.medium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Expanded(flex: 3, child: SvgPicture.asset(Vectors.success)),
              const SizedBox(height: Sizes.medium),
              Text(
                '${context.l10n.welcome}, ${user?.firstName}!',
                style: context.textTheme.titleLarge,
              ),
              const Spacer(),
              Button(
                onPressed: () =>
                    ref.read(goRouterProvider).go(HomePage.routeName),
                label: context.l10n.startNow,
              ),
              const SizedBox(height: Sizes.medium),
            ],
          ),
        ),
      ),
      loading: () => const Center(
        child: RepaintBoundary(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => ErrorContainer(
        message: context.l10n.errorCreatingAccount,
        onRetry: () => ref.read(authControllerProvider.notifier).signOut(),
      ),
    );
  }
}
