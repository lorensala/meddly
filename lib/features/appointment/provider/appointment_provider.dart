import 'package:appointment/appointment.dart';
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
