import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:measurement/measurement.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MeasurementForm extends StatelessWidget {
  const MeasurementForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: Sizes.mediumPadding,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ValueField(),
            SizedBox(height: Sizes.medium),
            _TypeDropDownSelector(),
            SizedBox(height: Sizes.medium),
            _UnitDropDownSelector(),
            SizedBox(height: Sizes.medium),
            _DateSelector(),
            SizedBox(height: Sizes.medium),
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
        const InputLabel(label: 'Measurement date', isRequired: true),
        const SizedBox(height: Sizes.small),
        DateSelector(
          initialDateTime: initialDateTime,
          onDateTimeChanged: notifier.dateChanged,
          errorText: null,
        ),
        const SizedBox(height: Sizes.small),
        const InputDescription(description: 'Algo que va a escribir Sofi'),
      ],
    );
  }
}

class _TypeDropDownSelector extends ConsumerWidget {
  const _TypeDropDownSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final selectedType = ref
        .watch(measurementFormControllerProvider.select((value) => value.type));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Tipo', isRequired: true),
        const SizedBox(height: Sizes.small),
        SizedBox(
          height: kBottomNavigationBarHeight,
          width: double.infinity,
          child: DropDownSelector(
            value: selectedType,
            hasBorder: true,
            items: MeasurementType.values
                .map(
                  (e) => DropdownMenuItem<MeasurementType>(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: notifier.typeChanged,
          ),
        ),
      ],
    );
  }
}

class _UnitDropDownSelector extends HookConsumerWidget {
  const _UnitDropDownSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUnit = useState<MeasurementUnit?>(null);
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final selectedType = ref
        .watch(measurementFormControllerProvider.select((value) => value.type));

    final units = getUnits(selectedType);

    if (units.isEmpty) {
      Future.delayed(Duration.zero, () => notifier.unitChanged(null));

      return const SizedBox.shrink();
    }

    if (units.length == 1) {
      Future.delayed(Duration.zero, () => notifier.unitChanged(units.first));

      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Tipo', isRequired: true),
        const SizedBox(height: Sizes.small),
        SizedBox(
          height: kBottomNavigationBarHeight,
          width: double.infinity,
          child: DropDownSelector<MeasurementUnit>(
            value: selectedUnit.value ?? units[0],
            hasBorder: true,
            items: units
                .map(
                  (e) => DropdownMenuItem<MeasurementUnit>(
                    value: e,
                    key: Key(e.name),
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: (v) {
              notifier.unitChanged(v);
              selectedUnit.value = v;
            },
          ),
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
        const InputLabel(label: 'Valor', isRequired: true),
        const SizedBox(height: Sizes.small),
        TextFormField(
          style: context.textTheme.bodyMedium,
          onChanged: notifier.valueChanged,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
        const SizedBox(height: Sizes.small),
        const InputDescription(description: 'Algo que va a escribir Sofi'),
      ],
    );
  }
}
