import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/controller/medicine_form_controller.dart';
import 'package:meddly/features/medicine/view/medicine_dosis_page.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

import '../provider/provider.dart';

class MedicinePresentationForm extends StatelessWidget {
  const MedicinePresentationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: Sizes.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: SvgPicture.asset(Assets.pills),
              ),
            ),
            const SizedBox(height: Sizes.largeSpacing),
            Text(
              context.l10n.commonPresentations,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: Sizes.smallSpacing),
            const _CommonPresentations(),
            const SizedBox(height: Sizes.largeSpacing),
            Text(
              context.l10n.otherPresentations,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: Sizes.smallSpacing),
            const _OtherPresentations(),
            const SizedBox(height: Sizes.mediumSpacing),
            const _NextButton(),
            const SizedBox(height: Sizes.largeSpacing),
          ],
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () => Navigator.of(context).push(MedicineDosisPage.route()),
      label: context.l10n.next,
    );
  }
}

class _OtherPresentations extends ConsumerWidget {
  const _OtherPresentations();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPresentation = ref.watch(medicinePresentationProvider);
    final notifier = ref.watch(medicineFormControllerProvider.notifier);

    return DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.borderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: MedicinePresentation.uncommon
              .map(
                (presentation) => ListTile(
                  title: Text(presentation.name.capitalize()),
                  trailing: selectedPresentation == presentation
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () => notifier.presentationChanged(presentation),
                ),
              )
              .toList(),
        ));
  }
}

class _CommonPresentations extends ConsumerWidget {
  const _CommonPresentations();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPresentation = ref.watch(medicinePresentationProvider);
    final notifier = ref.watch(medicineFormControllerProvider.notifier);

    return DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.borderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: MedicinePresentation.common
              .map(
                (presentation) => ListTile(
                  title: Text(presentation.name.capitalize()),
                  trailing: selectedPresentation == presentation
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () => notifier.presentationChanged(presentation),
                ),
              )
              .toList(),
        ));
  }
}
