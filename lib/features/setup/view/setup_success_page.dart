import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/home/home.dart';
import 'package:meddly/features/user/user.dart';
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
        title: const Text('Setup'),
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
                'Welcome ${user.asSome().firstName}!',
                style: context.textTheme.titleLarge,
              ),
              const Spacer(),
              Button(
                  onPressed: () =>
                      ref.read(goRouterProvider).go(HomePage.routeName),
                  label: 'Comenzar ahora!'),
              const SizedBox(height: Sizes.medium),
            ],
          ),
        ),
      ),
      loading: () => const Center(
          child: RepaintBoundary(child: CircularProgressIndicator())),
      error: (error, stack) => Text(error.toString()),
    );
  }
}
