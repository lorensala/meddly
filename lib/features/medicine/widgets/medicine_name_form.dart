import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/controller/medicine_form_controller.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineNameForm extends StatelessWidget {
  const MedicineNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: Sizes.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: SvgPicture.asset(Assets.pills),
            ),
            const SizedBox(height: Sizes.largeSpacing),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputLabel(
                  label: context.l10n.medicineName,
                  isRequired: true,
                ),
                const SizedBox(height: Sizes.smallSpacing),
                const _NameInputField(),
                const SizedBox(height: Sizes.smallSpacing),
                InputDescription(
                  description: context.l10n.medicineDescription,
                )
              ],
            ),
            const SizedBox(height: Sizes.mediumSpacing),
            const _NextButton(),
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
