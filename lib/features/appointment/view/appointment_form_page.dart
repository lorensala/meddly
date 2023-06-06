import 'package:appointment/appointment.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentFormPage extends HookConsumerWidget {
  const AppointmentFormPage(this.id, {super.key});

  final int? id;

  static const String routeName = 'appointment-form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointment = ref
        .watch(
      appointmentControllerProvider,
    )
        .whenOrNull(
      data: (appointments) {
        return appointments.firstWhereOrNull(
          (element) => element.id == id,
        );
      },
    );

    useEffect(
      () {
        if (appointment != null) {
          Future.delayed(
            Duration.zero,
            () {
              ref
                  .read(appointmentFormControllerProvider.notifier)
                  .loadAppointment(
                    appointment,
                  );
            },
          );
        }
        return null;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appointment == null
              ? context.l10n.newAppointment
              : context.l10n.editAppointment,
        ),
        leading: BackButton(
          onPressed: () {
            final form = ref.read(appointmentFormControllerProvider);

            if (form.isDirty) {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return const ConfirmBackDialog();
                },
              );
            } else {
              GoRouter.of(context).pop();
            }
          },
        ),
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          boxShadow: boxShadow(context),
        ),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Sizes.medium),
            child: SizedBox(
              height: Sizes.buttonHeight,
              child: AppointmentSaveButton(),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Builder(
              builder: (context) {
                return AsyncValueWidget(
                  value: ref.watch(appointmentControllerProvider),
                  builder: (_) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppointmentNameInput(),
                        const AppointmentSpecialityDropDown(),
                        AppointmentDateSelector(
                          initialValue: appointment?.date,
                        ),
                        const AppointmentDoctorInput(),
                        const AppointmentLocationInput(),
                        const AppointmentNotesInput(),
                      ],
                    );
                  },
                );
              },
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
    final isLoading = ref.watch(appointmentControllerProvider).isLoading;
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select(
        (value) => value.isEditing,
      ),
    );
    final isValid = ref.watch(isAppointmentFormValidProvider) && !isLoading;

    return Button(
      isValid: isValid,
      onPressed: () => isEditing
          ? ref.read(appointmentFormControllerProvider.notifier).save()
          : ref.read(appointmentFormControllerProvider.notifier).add(),
      label: context.l10n.save,
    );
  }
}

class AppointmentNotesInput extends HookConsumerWidget {
  const AppointmentNotesInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final controller = useTextEditingController();

    ref.listen(
      appointmentFormControllerProvider.select((value) => value.notes),
      (_, notes) {
        controller.value = TextEditingValue(
          text: notes,
          selection: TextSelection.collapsed(offset: notes.length),
        );
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Notas', isRequired: false),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          controller: controller,
          style: context.textTheme.bodyMedium,
          onChanged: notifier.onNotesChanged,
          maxLength: 200,
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

class AppointmentLocationInput extends HookConsumerWidget {
  const AppointmentLocationInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final controller = useTextEditingController();

    ref.listen(
      appointmentFormControllerProvider.select((value) => value.location),
      (_, location) {
        controller.value = TextEditingValue(
          text: location,
          selection: TextSelection.collapsed(offset: location.length),
        );
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Ubicación', isRequired: false),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          controller: controller,
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

class AppointmentDoctorInput extends HookConsumerWidget {
  const AppointmentDoctorInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final controller = useTextEditingController();

    ref.listen(
      appointmentFormControllerProvider.select((value) => value.doctor),
      (_, doctor) {
        controller.value = TextEditingValue(
          text: doctor.value,
          selection: TextSelection.collapsed(offset: doctor.value.length),
        );
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Nombre del médico', isRequired: false),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          controller: controller,
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

class AppointmentDateSelector extends HookConsumerWidget {
  const AppointmentDateSelector({
    super.key,
    this.initialValue,
  });

  final DateTime? initialValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Fecha y hora', isRequired: true),
        const SizedBox(height: Sizes.extraSmall),
        DateSelector(
          initialValue: initialValue,
          initialDateTime: DateTime.now(),
          firstDate: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateTimeChanged: notifier.onDateChanged,
          errorText: null,
        ),
        const SizedBox(height: Sizes.medium),
      ],
    );
  }
}

class AppointmentSpecialityDropDown extends HookConsumerWidget {
  const AppointmentSpecialityDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final value = ref.watch(
      appointmentFormControllerProvider.select((value) => value.speciality),
    );

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

class AppointmentNameInput extends HookConsumerWidget {
  const AppointmentNameInput({
    this.appointment,
    super.key,
  });

  final Appointment? appointment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appointmentFormControllerProvider.notifier);
    final controller = useTextEditingController();
    final name = ref
        .watch(
          appointmentFormControllerProvider,
        )
        .name;

    useEffect(
      () {
        controller.value = TextEditingValue(
          text: name.value,
          selection: TextSelection.collapsed(offset: name.value.length),
        );
        return null;
      },
      [name],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputLabel(label: 'Nombre', isRequired: true),
        const SizedBox(height: Sizes.extraSmall),
        TextFormField(
          controller: controller,
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
