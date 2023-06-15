import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';

class MedicineNameForm extends StatelessWidget {
  const MedicineNameForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: EdgeInsets.all(Sizes.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: SvgPicture.asset(Vectors.onboarding3)),
            const SizedBox(height: Sizes.medium),
            FormTitle(title: context.l10n.medicineName, isRequired: true),
            const SizedBox(height: Sizes.large),
            const _NameInputField(),
          ],
        ),
      ),
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
      style: context.textTheme.bodyMedium,
      onChanged: notifier.nameChanged,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: context.l10n.medicineDescription,
      ),
    );
  }
}
