// ignore_for_file: avoid_public_notifier_properties
import 'package:appointment/appointment.dart';
import 'package:flutter/material.dart';
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
        id: existingAppointment.id ?? 0,
        name: Name.dirty(existingAppointment.name),
        speciality: Specialty.dirty(existingAppointment.speciality),
        date: AppointmentDate.dirty(
          DateTime(
            existingAppointment.date.year,
            existingAppointment.date.month,
            existingAppointment.date.day,
          ),
        ),
        time: AppointmentTime.dirty(
          TimeOfDay(
            hour: existingAppointment.date.hour,
            minute: existingAppointment.date.minute,
          ),
        ),
        doctor: Doctor.dirty(existingAppointment.doctor ?? ''),
        location: Location.dirty(existingAppointment.location),
        notes: Notes.dirty(existingAppointment.notes),
        isEditing: false,
        isNew: false,
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
    final date = AppointmentDate.dirty(value);
    state = state.copyWith(date: date);
  }

  void onTimeChanged(TimeOfDay value) {
    final time = AppointmentTime.dirty(value);
    state = state.copyWith(time: time);
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
      date: DateTime(
        state.date.value!.year,
        state.date.value!.month,
        state.date.value!.day,
        state.time.value!.hour,
        state.time.value!.minute,
      ),
      doctor: state.doctor.value,
      location: state.location.value,
      notes: state.notes.value,
    );

    if (state.isNew) {
      await ref
          .watch(appointmentControllerProvider.notifier)
          .addAppointment(appointment);
    } else {
      await ref
          .watch(appointmentControllerProvider.notifier)
          .updateAppointment(appointment);
    }
  }
}
