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
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(Sizes.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MeasurementTypeDropDownSelector(),
            MeasurementUnitDropDownSelector(),
            MeasurementValueField(),
            MeasurementDateSelector(),
          ],
        ),
      ),
    );
  }
}

class MeasurementDateSelector extends HookConsumerWidget {
  const MeasurementDateSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final isEditing = ref.watch(
      measurementFormControllerProvider.select(
        (value) => value.isEditing,
      ),
    );

    final date = ref.watch(
      measurementFormControllerProvider.select(
        (value) => value.date,
      ),
    );

    final controller = useTextEditingController(
      text: date?.localizedString(context),
    );

    ref.listen(measurementFormControllerProvider, (_, state) {
      controller.text = state.date?.localizedString(context) ?? '';
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          readOnly: true,
          enabled: isEditing,
          controller: controller,
          style: context.textTheme.bodyMedium,
          onTap: () async {
            final date = await showAdaptiveDatePicker(
              context: context,
              initialDateTime: DateTime.now(),
            );
            if (date != null) {
              notifier.dateChanged(date);
            }
          },
          keyboardType: TextInputType.number,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            filled: !isEditing,
            labelText: 'Seleccionar una fecha*',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class MeasurementTypeDropDownSelector extends ConsumerWidget {
  const MeasurementTypeDropDownSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final isEditing = ref.watch(
      measurementFormControllerProvider.select(
        (value) => value.isEditing,
      ),
    );
    final selectedType = ref
        .watch(measurementFormControllerProvider.select((value) => value.type));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<MeasurementType>(
          value: selectedType,
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            labelText: 'Tipo de medición*',
            border: const OutlineInputBorder(),
            filled: !isEditing,
          ),
          items: MeasurementType.values
              .map(
                (e) => DropdownMenuItem<MeasurementType>(
                  value: e,
                  child: Text(
                    e.localizedString(context.l10n),
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: isEditing ? notifier.typeChanged : null,
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class MeasurementUnitDropDownSelector extends HookConsumerWidget {
  const MeasurementUnitDropDownSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final isEditing = ref.watch(
      measurementFormControllerProvider.select(
        (value) => value.isEditing,
      ),
    );
    final selectedType = ref
        .watch(measurementFormControllerProvider.select((value) => value.type));
    final selectedUnit = ref
        .watch(measurementFormControllerProvider.select((value) => value.unit));

    if (selectedType.units.isEmpty) {
      Future.delayed(Duration.zero, () => notifier.unitChanged(null));

      return const SizedBox.shrink();
    }

    if (selectedType.units.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<MeasurementUnit>(
          value: selectedUnit,
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            filled: !isEditing,
            labelText: 'Unidad*',
            border: const OutlineInputBorder(),
          ),
          items: selectedType.units
              .map(
                (e) => DropdownMenuItem<MeasurementUnit>(
                  value: e,
                  child: Text(
                    e.localizedString(context.l10n),
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              )
              .toList(),
          onChanged: isEditing ? notifier.unitChanged : null,
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class MeasurementValueField extends ConsumerWidget {
  const MeasurementValueField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(measurementFormControllerProvider.notifier);
    final isEditing = ref.watch(
      measurementFormControllerProvider.select(
        (value) => value.isEditing,
      ),
    );
    final value = ref.watch(
      measurementFormControllerProvider.select(
        (value) => value.value,
      ),
    );

    final errorText = !value.isPure && value.isNotValid
        ? context.l10n.invalidMeasurementValue
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: value.value,
          enabled: isEditing,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.valueChanged,
          keyboardType: TextInputType.number,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            filled: !isEditing,
            errorText: errorText,
            labelText: 'Medición*',
          ),
        ),
        const SizedBox(height: Sizes.small),
        const InputDescription(
          description: 'El valor de la medición en la unidad seleccionada',
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
