import 'package:appointment/appointment.dart';
import 'package:meddly/features/appointment/controller/apointment_form_controller.dart';
import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appointment_provider.g.dart';

@riverpod
AppointmentApi appointmentApi(AppointmentApiRef ref) {
  return AppointmentApi(ref.watch(dioProvider));
}

@riverpod
AppointmentRepository appointmentRepository(AppointmentRepositoryRef ref) {
  return AppointmentRepository(api: ref.watch(appointmentApiProvider));
}

@Riverpod(dependencies: [])
Appointment appointment(AppointmentRef ref) {
  throw UnimplementedError();
}

@riverpod
bool isAppointmentFormValid(IsAppointmentFormValidRef ref) {
  return ref.watch(
    appointmentFormControllerProvider
        .select((s) => s.name.isValid && s.date != null),
  );
}
