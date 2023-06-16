// ignore_for_file: avoid_public_notifier_properties
import 'package:appointment/appointment.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'apointment_form_controller.g.dart';

@Riverpod(dependencies: [existingAppointment])
class AppointmentFormController extends _$AppointmentFormController {
  @override
  AppointmentFormState build() {
    final existingAppointment = ref.watch(existingAppointmentProvider);

    if (existingAppointment != null) {
      return AppointmentFormState(
        id: existingAppointment.id!,
        name: Name.dirty(existingAppointment.name),
        speciality: Specialty.dirty(existingAppointment.speciality),
        dateTime: AppointmentDateTime.dirty(existingAppointment.date),
        doctor: Doctor.dirty(existingAppointment.doctor ?? ''),
        location: Location.dirty(existingAppointment.location),
        notes: Notes.dirty(existingAppointment.notes),
        isEditing: false,
      );
    }
    return const AppointmentFormState();
  }

  void onNameChanged(String value) {
    state = state.copyWith(name: Name.dirty(value));
  }

  void onSpecialityChanged(AppointmentSpeciality value) {
    final speciality = Specialty.dirty(value);
    state = state.copyWith(speciality: speciality);
  }

  void onDateChanged(DateTime value) {
    final date = AppointmentDateTime.dirty(value);
    state = state.copyWith(dateTime: date);
  }

  void onDoctorChanged(String value) {
    final doctor = Doctor.dirty(value);
    state = state.copyWith(doctor: doctor);
  }

  void onLocationChanged(String value) {
    final location = Location.dirty(value);
    state = state.copyWith(location: location);
  }

  void onNotesChanged(String value) {
    final notes = Notes.dirty(value);
    state = state.copyWith(notes: notes);
  }

  void edit() {
    state = state.copyWith(isEditing: true);
  }

  Future<void> save() async {
    final appointment = Appointment(
      id: state.id,
      name: state.name.value,
      speciality: state.speciality.value,
      date: state.dateTime.value!,
      doctor: state.doctor.value,
      location: state.location.value,
      notes: state.notes.value,
    );

    if (state.isEditing) {
      await ref
          .watch(appointmentControllerProvider.notifier)
          .updateAppointment(appointment);
    } else {
      await ref
          .watch(appointmentControllerProvider.notifier)
          .addAppointment(appointment);
    }
  }
}
