import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/controller/medicine_form_controller.dart';
import 'package:meddly/features/medicine/provider/provider.dart';
import 'package:meddly/features/medicine/view/medicine_dosis_page.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicinePresentationForm extends StatelessWidget {
  const MedicinePresentationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: Sizes.mediumPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: context.colorScheme.secondary,
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 300, maxHeight: 300),
                child: SvgPicture.asset(Vectors.medicinePresentation),
              ),
            ),
            ColoredBox(
              color: context.colorScheme.secondary,
              child: const SizedBox(
                height: Sizes.large,
                width: double.infinity,
              ),
            ),
            ColoredBox(
              color: context.colorScheme.secondary,
              child: const FormTitle(
                title: 'Seleccione la presentación  del medicamento',
                isRequired: true,
              ),
            ),
            ColoredBox(
              color: context.colorScheme.secondary,
              child: const SizedBox(
                height: Sizes.large,
                width: double.infinity,
              ),
            ),
            PresentationList(
              presentations: MedicinePresentation.common,
              title: context.l10n.commonPresentations,
              isInitiallyExpanded: true,
            ),
            const ColoredBox(
              color: Colors.transparent,
              child: SizedBox(
                height: Sizes.medium,
                width: double.infinity,
              ),
            ),
            PresentationList(
              presentations: MedicinePresentation.uncommon,
              title: context.l10n.otherPresentations,
            ),
            const SizedBox(height: Sizes.medium),
            const _NextButton(),
            const SizedBox(height: Sizes.large),
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

class PresentationList extends StatelessWidget {
  const PresentationList({
    required this.presentations,
    required this.title,
    super.key,
    this.isInitiallyExpanded = false,
  });

  final List<MedicinePresentation> presentations;
  final String title;
  final bool isInitiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isInitiallyExpanded,
          title: Text(title),
          children: presentations.map(PresentationListItem.new).toList(),
        ),
      ),
    );
  }
}

class PresentationListItem extends ConsumerWidget {
  const PresentationListItem(
    this.presentation, {
    super.key,
  });

  final MedicinePresentation presentation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final selectedPresentation = ref.watch(medicinePresentationProvider);

    return ListTile(
      selected: selectedPresentation == presentation,
      title: Text(presentation.name.capitalize()),
      trailing:
          selectedPresentation == presentation ? const Icon(Icons.check) : null,
      onTap: () => notifier.presentationChanged(presentation),
    );
  }
}
