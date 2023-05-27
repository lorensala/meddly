import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class SetupHeightWeightPage extends StatelessWidget {
  const SetupHeightWeightPage({super.key});

  static const String routeName = '/setup/height-weight';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SetupHeightWeightPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.setup),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: context.height,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.medium),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: Sizes.medium),
                  Flexible(
                    child: SvgPicture.asset(Vectors.heightWeight),
                  ),
                  const SizedBox(height: Sizes.medium),
                  FormTitle(title: context.l10n.setupHeightWeightTitle),
                  const SizedBox(height: Sizes.small),
                  FormSubtitle(
                    subtitle: context.l10n.setupHeightWeightSubtitle,
                  ),
                  const SizedBox(height: Sizes.extraLarge),
                  const SetupHeightInput(),
                  const SizedBox(height: Sizes.medium),
                  const SetupWeightInput(),
                  const SizedBox(height: Sizes.large),
                  const _SaveButton(),
                  const SizedBox(height: Sizes.large),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) => showSnackBar(context, err.toString()),
      );
    });

    final weight = ref.watch(setupControllerProvider.select((s) => s.weight));
    final height = ref.watch(setupControllerProvider.select((s) => s.height));
    final isLoading = ref.watch(userControllerProvider).isLoading;

    final isHeightValid =
        (height.isValid && height.value.isNotEmpty) || height.isPure;
    final isWeightValid =
        (weight.isValid && weight.value.isNotEmpty) || weight.isPure;

    return Button(
      isValid: isHeightValid && isWeightValid,
      isLoading: isLoading,
      onPressed: () => ref.read(setupControllerProvider.notifier).save(),
      label: context.l10n.save,
    );
  }
}
