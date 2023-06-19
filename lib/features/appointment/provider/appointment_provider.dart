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

@riverpod
class AppointmentSpecialities extends _$AppointmentSpecialities {
  @override
  List<AppointmentSpeciality> build() {
    return AppointmentSpeciality.values;
  }

  void select(AppointmentSpeciality speciality) {
    state = [...state, speciality];
  }

  void deselect(AppointmentSpeciality speciality) {
    state = state.where((s) => s != speciality).toList();
  }

  void clear() {
    state = [];
  }
}

@riverpod
List<Appointment> filteredAppointments(FilteredAppointmentsRef ref) {
  final appointments = ref.watch(appointmentControllerProvider);
  final filtersSelected = ref.watch(appointmentSpecialitiesProvider);

  return appointments.when(
    data: (data) {
      return data.where((a) {
        return filtersSelected.contains(a.speciality);
      }).toList();
    },
    error: (_, __) => [],
    loading: () => [],
  );
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
