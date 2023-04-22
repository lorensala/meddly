import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/controller/medicine_form_controller.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineNameForm extends StatelessWidget {
  const MedicineNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: Sizes.mediumPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: SvgPicture.asset(Vectors.onboarding3)),
            const SizedBox(height: Sizes.large),
            FormTitle(title: context.l10n.medicineName, isRequired: true),
            const SizedBox(height: Sizes.small),
            FormSubtitle(subtitle: context.l10n.medicineDescription),
            const SizedBox(height: Sizes.large),
            const _NameInputField(),
            const SizedBox(height: Sizes.extraLarge),
            const _NextButton(),
            const SizedBox(height: Sizes.large),
          ],
        ),
      ),
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isMedicineNameValidProvider);
    return Button(
      isValid: isValid,
      onPressed: () => Navigator.of(context).push(
        MedicinePresentationPage.route(),
      ),
      label: context.l10n.next,
    );
  }
}

class _NameInputField extends ConsumerWidget {
  const _NameInputField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final errorText = ref.watch(medicineNameErrorTextProvider);

    return TextFormField(
      onChanged: notifier.nameChanged,
      decoration: InputDecoration(
        errorText: errorText,
      ),
    );
  }
}
