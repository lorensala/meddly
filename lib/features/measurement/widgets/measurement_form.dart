import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/measurement/controller/measurement_controller.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MeasurementForm extends StatelessWidget {
  const MeasurementForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.padding,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ValueField(),
            const SizedBox(height: Sizes.mediumSpacing),
            _TypeDropDownSelector(),
            const SizedBox(height: Sizes.mediumSpacing),
            _DateSelector(),
            const SizedBox(height: Sizes.mediumSpacing),
            _SaveButton()
          ],
        ),
      ),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final isValid = ref.watch(measurementIsValidProvider);
    final isLoading = ref.watch(measurementControllerProvider).isLoading;

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: notifier.save,
      label: context.l10n.save,
    );
  }
}

class _DateSelector extends ConsumerWidget {
  const _DateSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final initialDateTime = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: 'Measurement date', isRequired: true),
        const SizedBox(height: Sizes.smallSpacing),
        DateSelector(
            initialDateTime: initialDateTime,
            onDateTimeChanged: notifier.dateChanged,
            errorText: null),
        const SizedBox(height: Sizes.smallSpacing),
        InputDescription(description: 'Algo que va a escribir Sofi'),
      ],
    );
  }
}

class _TypeDropDownSelector extends ConsumerWidget {
  const _TypeDropDownSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final selectedType = ref.watch(measurementTypeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: 'Tipo', isRequired: true),
        const SizedBox(height: Sizes.smallSpacing),
        SizedBox(
          width: double.infinity,
          child: DropDownSelector(
              value: selectedType,
              items: MeasurementType.values
                  .map((e) => DropdownMenuItem<MeasurementType>(
                        child: Text(e.name),
                        value: e,
                      ))
                  .toList(),
              onChanged: notifier.typeChanged),
        ),
      ],
    );
  }
}

class _ValueField extends ConsumerWidget {
  const _ValueField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final errorText = ref.watch(measurementValueErrorProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: 'Valor', isRequired: true),
        const SizedBox(height: Sizes.smallSpacing),
        TextFormField(
          onChanged: notifier.valueChanged,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
        const SizedBox(height: Sizes.smallSpacing),
        InputDescription(description: 'Algo que va a escribir Sofi'),
      ],
    );
  }
}
