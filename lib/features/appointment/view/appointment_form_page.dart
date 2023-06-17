import 'package:appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentFormPage extends HookConsumerWidget {
  const AppointmentFormPage({this.appointment, super.key});

  static const String routeName = 'appointment-form';

  final Appointment? appointment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appointments,
        ),
        leading: BackButton(
          onPressed: () {
            final form = ref.read(appointmentFormControllerProvider);
            final isEditing = ref.read(
              appointmentFormControllerProvider
                  .select((value) => value.isEditing),
            );

            if (!isEditing) {
              return GoRouter.of(context).pop();
            }

            if (form.isDirty) {
              showDialog<void>(
                context: context,
                builder: (context) => const ConfirmBackDialog(),
              );
            } else {
              GoRouter.of(context).pop();
            }
          },
        ),
      ),
      bottomNavigationBar: ColoredBox(
        color: context.colorScheme.secondary,
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Sizes.medium),
            child: SizedBox(
              height: Sizes.buttonHeight,
              child: _SaveButton(),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Builder(
          builder: (context) {
            return AsyncValueWidget(
              value: ref.watch(appointmentControllerProvider),
              builder: (_) {
                return const SingleChildScrollView(
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
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(
      appointmentFormControllerProvider.select(
        (value) => value.isEditing,
      ),
    );

    final isValid = ref.watch(isAppointmentValidProvider);

    return Button(
      isValid: isValid,
      onPressed: () {
        if (isEditing) {
          ref.read(appointmentFormControllerProvider.notifier).save();
        } else {
          ref.read(appointmentFormControllerProvider.notifier).edit();
        }
      },
      label: isEditing ? context.l10n.save : context.l10n.editAppointment,
    );
  }
}
