import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionValidatePage extends HookConsumerWidget {
  const PredictionValidatePage({super.key});

  static const String routeName = 'validate';
  static const String fullRouteName =
      '${BrowsePage.routeName}/${PredictionsPage.routeName}/${PredictionValidatePage.routeName}';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(predictionControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) => showSnackBar(context, err.toString()),
      );
    });

    final isSearching = ref.watch(
      consultValidateControllerProvider.select((value) => value.isSearching),
    );

    return Scaffold(
      bottomNavigationBar: const _ValidateButton(),
      appBar: AppBar(
        title: Text(context.l10n.validateConsult),
      ),
      body: !isSearching ? const _InitialBody() : const _SearchBody(),
    );
  }
}

class _InitialBody extends ConsumerWidget {
  const _InitialBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final consult = ref.watch(consultProvider);
    final selectedDisease = ref.watch(
      consultValidateControllerProvider.select((value) => value.disease),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          children: [
            Center(
              child: SizedBox.square(
                dimension: selectedDisease == null
                    ? context.width * 0.8
                    : context.width * 0.7,
                child: SvgPicture.asset(Vectors.ai),
              ),
            ),
            PredictionsDiseaseSearchInput(
              enabled: false,
              onTap: () => ref
                  .read(consultValidateControllerProvider.notifier)
                  .isSearching(value: true),
            ),
            const SizedBox(height: Sizes.small),
            InputDescription(
              description: context.l10n.enterTheDiagnostedDisease,
            ),
            const SizedBox(height: Sizes.large),
            const PredictionDiseaseWrapSelectedItem(),
            const SizedBox(height: Sizes.large),
            const _Checkbox(),
            const SizedBox(height: Sizes.large),
          ],
        ),
      ),
    );
  }
}

class _Checkbox extends ConsumerWidget {
  const _Checkbox();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAccepted = ref.watch(
      consultValidateControllerProvider.select((value) => value.isAccepted),
    );

    return GestureDetector(
      onTap: () => ref
          .read(consultValidateControllerProvider.notifier)
          .isAccepted(value: !isAccepted),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: Sizes.medium,
            child: Checkbox(
              value: isAccepted,
              onChanged: (value) {
                if (value == null) return;
                ref
                    .read(consultValidateControllerProvider.notifier)
                    .isAccepted(value: value);
              },
            ),
          ),
          const SizedBox(width: Sizes.medium),
          Expanded(
            child: Text(
              context.l10n.acceptIAToUseMyData,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(Sizes.medium),
          child: PredictionsDiseaseSearchInput(
            autofocus: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Sizes.medium),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.l10n.results,
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
        const Expanded(
          child: PredictionDiseaseResultsList(),
        )
      ],
    );
  }
}

class _ValidateButton extends ConsumerWidget {
  const _ValidateButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(
      consultValidateControllerProvider
          .select((value) => value.disease != null),
    );
    final isLoading = ref.watch(predictionControllerProvider).isLoading;

    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.small),
        boxShadow: boxShadow(context),
      ),
      padding: const EdgeInsets.all(Sizes.medium),
      child: SizedBox(
        height: Sizes.buttonHeight,
        child: Button(
          isValid: isValid,
          isLoading: isLoading,
          onPressed: () =>
              ref.read(consultValidateControllerProvider.notifier).validate(),
          label: context.l10n.validateConsult,
        ),
      ),
    );
  }
}
