import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupBirthdatePage extends StatelessWidget {
  const SetupBirthdatePage({super.key});

  static const String routeName = '/setup/birthdate';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const SetupBirthdatePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: context.height,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: Sizes.medium),
                Flexible(child: SvgPicture.asset(Vectors.birthdate)),
                const SizedBox(height: Sizes.medium),
                SetupTitle(
                  title: context.l10n.setupBirthdateTitle,
                  isRequired: true,
                ),
                const SizedBox(height: Sizes.small),
                SetupSubtitle(subtitle: context.l10n.setupBirthdateSubtitle),
                const SizedBox(height: Sizes.extraLarge),
                const SetupBirthdateInput(),
                const SizedBox(height: Sizes.large),
                const _NextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBirthdateValid = ref.watch(setupBirthdateProvider).valid &&
        !ref.watch(setupBirthdateProvider).pure;

    return Button(
        isValid: isBirthdateValid,
        onPressed: () =>
            ref.read(goRouterProvider).push(SetupSexPage.routeName),
        label: context.l10n.next);
  }
}
