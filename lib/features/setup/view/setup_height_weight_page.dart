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
        builder: (_) => const SetupHeightWeightPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: Sizes.medium),
                  Flexible(child: SvgPicture.asset(Vectors.heightWeight)),
                  const SizedBox(height: Sizes.medium),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('What is your height and weight?',
                        style: context.textTheme.titleLarge),
                  ),
                  const SizedBox(height: Sizes.small),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('We will use this for your medical records',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color:
                              context.colorScheme.onBackground.withOpacity(0.5),
                        )),
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

// class _SkipButton extends ConsumerWidget {
//   const _SkipButton();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: () => ref.read(goRouterProvider).push(PhonePage.routeName),
//       child: Center(
//           child: Text(
//         context.l10n.skip,
//         style: const TextStyle(
//           fontStyle: FontStyle.italic,
//           decoration: TextDecoration.underline,
//         ),
//       )),
//     );
//   }
// }

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) => showSnackBar(context, err.toString()),
      );
    });

    final weight = ref.watch(setupWeightProvider);
    final height = ref.watch(setupHeightProvider);
    final isLoading = ref.watch(userControllerProvider).isLoading;

    final isHeightValid =
        (height.valid && height.value.isNotEmpty) || height.pure;
    final isWeightValid =
        (weight.valid && weight.value.isNotEmpty) || weight.pure;

    return Button(
        isValid: isHeightValid && isWeightValid,
        isLoading: isLoading,
        onPressed: () => ref.read(setupControllerProvider.notifier).save(),
        label: context.l10n.save);
  }
}
