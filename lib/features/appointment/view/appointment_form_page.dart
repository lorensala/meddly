import 'package:appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/features/appointment/controller/apointment_form_controller.dart';
import 'package:meddly/features/appointment/controller/appointment_controller.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentFormPage extends StatelessWidget {
  const AppointmentFormPage({super.key});

  static const String routeName = 'new-appointment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Appointment'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Sizes.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppointmentNameInput(),
                AppointmentSpecialityDropDown(),
                AppointmentDateSelector(),
                AppointmentDoctorInput(),
                AppointmentLocationInput(),
                AppointmentNotesInput(),
                AppointmentSaveButton(),
                SizedBox(height: Sizes.extraLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentSaveButton extends ConsumerWidget {
  const AppointmentSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isAppointmentFormValidProvider);
    final isLoading = ref.watch(appointmentControllerProvider).isLoading;

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: () =>
          ref.read(appointmentFormControllerProvider.notifier).save(),
      label: context.l10n.save,
    );
  }
}

class AppointmentNotesInput extends ConsumerWidget {
  const AppointmentNotesInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Notas', isRequired: false),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onNotesChanged,
          keyboardType: TextInputType.multiline,
          maxLines: 4,
          decoration: const InputDecoration(
            hintText: 'Ej: Llevar estudios previos',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class AppointmentLocationInput extends ConsumerWidget {
  const AppointmentLocationInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Ubicación', isRequired: false),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onLocationChanged,
          decoration: const InputDecoration(
            hintText: 'Ej: Hospital Italiano',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class AppointmentDoctorInput extends ConsumerWidget {
  const AppointmentDoctorInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Nombre del médico', isRequired: false),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onDoctorChanged,
          decoration: const InputDecoration(
            hintText: 'Ej: Dr. Juan Pérez',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class AppointmentDateSelector extends ConsumerWidget {
  const AppointmentDateSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Fecha y hora', isRequired: true),
        const SizedBox(height: Sizes.extraSmall),
        DateSelector(
          initialDateTime: DateTime.now(),
          onDateTimeChanged: notifier.onDateChanged,
          errorText: null,
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class AppointmentSpecialityDropDown extends ConsumerWidget {
  const AppointmentSpecialityDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final value = ref.watch(appointmentFormControllerProvider).speciality;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Especialidad', isRequired: true),
        const SizedBox(height: Sizes.extraSmall),
        Container(
          width: double.infinity,
          height: Sizes.large * 2.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.small),
            border: Border.all(
              color: context.colorScheme.surface,
              width: 1.5,
            ),
          ),
          child: DropDownSelector<AppointmentSpeciality>(
            value: value,
            items: AppointmentSpeciality.values
                .map(
                  (e) => DropdownMenuItem<AppointmentSpeciality>(
                    value: e,
                    child: Text(
                      e.name.capitalize(),
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) => notifier.onSpecialityChanged(value!),
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class AppointmentNameInput extends ConsumerWidget {
  const AppointmentNameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Nombre', isRequired: true),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onNameChanged,
          decoration: const InputDecoration(
            hintText: 'Ej: Turno médico de cabecera',
          ),
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}
