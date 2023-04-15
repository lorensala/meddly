import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupHeightWeightPage extends StatelessWidget {
  const SetupHeightWeightPage({super.key});

  static const String routeName = '/setup/height-weight';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const SetupHeightWeightPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                context.l10n.skip,
                style: context.textTheme.bodySmall,
              )),
        ],
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
                Flexible(child: SvgPicture.asset(Vectors.heightWeight)),
                const SizedBox(height: Sizes.extraLarge),
                const SetupHeightInput(),
                const SizedBox(height: Sizes.medium),
                const SetupWeightInput(),
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
    final weight = ref.watch(setupWeightProvider);
    final height = ref.watch(setupHeightProvider);

    final isHeightValid =
        (height.valid && height.value.isNotEmpty) || height.pure;
    final isWeightValid =
        (weight.valid && weight.value.isNotEmpty) || weight.pure;

    return Button(
        isValid: isHeightValid && isWeightValid,
        onPressed: () => ref.read(goRouterProvider).push(PhonePage.routeName),
        label: context.l10n.next);
  }
}
