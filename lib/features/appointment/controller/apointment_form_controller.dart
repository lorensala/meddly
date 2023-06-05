// ignore_for_file: avoid_public_notifier_properties
import 'package:appointment/appointment.dart';
import 'package:meddly/features/appointment/controller/appointment_controller.dart';
import 'package:meddly/features/appointment/state/appointment_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'apointment_form_controller.g.dart';

@riverpod
class AppointmentFormController extends _$AppointmentFormController {
  @override
  AppointmentFormState build() {
    return const AppointmentFormState();
  }

  void loadAppointment(Appointment existingAppointment) {
    state = state.copyWith(
      id: existingAppointment.id!,
      name: Name.dirty(existingAppointment.name),
      speciality: existingAppointment.speciality!,
      date: existingAppointment.date,
      doctor: Name.dirty(existingAppointment.doctor ?? ''),
      location: existingAppointment.location ?? '',
      notes: existingAppointment.notes ?? '',
      isEditing: true,
    );
  }

  void onNameChanged(String value) {
    state = state.copyWith(name: Name.dirty(value));
  }

  void onSpecialityChanged(AppointmentSpeciality value) {
    state = state.copyWith(speciality: value);
  }

  void onDateChanged(DateTime value) {
    state = state.copyWith(date: value);
  }

  void onDoctorChanged(String value) {
    state = state.copyWith(doctor: Name.dirty(value));
  }

  void onLocationChanged(String value) {
    state = state.copyWith(location: value);
  }

  void onNotesChanged(String value) {
    state = state.copyWith(notes: value);
  }

  Future<void> add() async {
    final appointment = Appointment(
      name: state.name.value,
      speciality: state.speciality,
      date: state.date!,
      doctor: state.doctor.value,
      location: state.location,
      notes: state.notes,
    );

    await ref
        .watch(appointmentControllerProvider.notifier)
        .addAppointment(appointment);
  }

  Future<void> save() async {
    final appointment = Appointment(
      id: state.id,
      name: state.name.value,
      speciality: state.speciality,
      date: state.date!,
      doctor: state.doctor.value,
      location: state.location,
      notes: state.notes,
    );

    await ref
        .watch(appointmentControllerProvider.notifier)
        .updateAppointment(appointment);
  }
}
