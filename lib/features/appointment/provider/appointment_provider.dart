import 'package:appointment/appointment.dart';
import 'package:collection/collection.dart';
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

@riverpod
bool isAppointmentFormValid(IsAppointmentFormValidRef ref) {
  return ref.watch(
    appointmentFormControllerProvider
        .select((s) => s.name.isValid && s.date != null),
  );
}

@riverpod
void loadExistingAppointment(LoadExistingAppointmentRef ref, {int? id}) {
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

  if (appointment != null) {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(appointmentFormControllerProvider.notifier).loadAppointment(
              appointment,
            );
      },
    );
  }
}
