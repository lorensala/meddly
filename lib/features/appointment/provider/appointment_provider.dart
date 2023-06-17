import 'package:appointment/appointment.dart';
import 'package:meddly/features/appointment/appointment.dart';
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

@Riverpod(dependencies: [])
Appointment? existingAppointment(ExistingAppointmentRef ref) {
  return null;
}

@Riverpod(dependencies: [AppointmentFormController])
bool isAppointmentValid(IsAppointmentValidRef ref) {
  final isEditing = ref.watch(
    appointmentFormControllerProvider.select((value) => value.isEditing),
  );
  final isLoading = ref.watch(appointmentControllerProvider).isLoading;

  if (!isEditing) {
    return true;
  }

  return ref.watch(
        appointmentFormControllerProvider.select((value) => value.isValid),
      ) &&
      !isLoading;
}
