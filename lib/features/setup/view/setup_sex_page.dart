import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupSexPage extends StatelessWidget {
  const SetupSexPage({super.key});

  static const String routeName = '/setup/sex';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SetupSexPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.setup),
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
                Flexible(child: SvgPicture.asset(Vectors.sex)),
                const SizedBox(height: Sizes.medium),
                FormTitle(title: context.l10n.setupSexTitle, isRequired: true),
                const SizedBox(height: Sizes.small),
                FormSubtitle(subtitle: context.l10n.setupSexSubtitle),
                const SizedBox(height: Sizes.small),
                const SetupSexSelector(),
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
    final isBirthdateValid = ref.watch(setupSexProvider).valid &&
        !ref.watch(setupBirthdateProvider).pure;

    return Button(
      isValid: isBirthdateValid,
      onPressed: () =>
          ref.read(goRouterProvider).push(SetupHeightWeightPage.routeName),
      label: context.l10n.next,
    );
  }
}
