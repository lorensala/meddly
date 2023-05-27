import 'package:appointment/appointment.dart';
import 'package:meddly/features/appointment/core/core.dart';
import 'package:meddly/features/appointment/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appointment_controller.g.dart';

@riverpod
class AppointmentController extends _$AppointmentController {
  @override
  FutureOr<List<Appointment>> build() async {
    final repository = ref.watch(appointmentRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    final (err, appointments) = await repository.fectchAll();

    if (err != null) {
      throw Exception(err.describe(l10n));
    } else {
      return appointments;
    }
  }

  void refresh() {
    ref.invalidateSelf();
  }

  Future<void> addAppointment(Appointment appointment) async {
    final repository = ref.watch(appointmentRepositoryProvider);

    final (err, _) = await repository.addAppointment(appointment);

    if (err != null) {
      state = AsyncError(err.toString(), StackTrace.current);
    } else {
      refresh();
      ref.watch(goRouterProvider).pop();
    }
  }

  Future<void> deleteAppointment(int id) async {
    final repository = ref.watch(appointmentRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    final (err, _) = await repository.deleteAppointment(id);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      refresh();
    }
  }

  Future<void> updateAppointment(Appointment appointment) async {
    final repository = ref.watch(appointmentRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    final (err, _) = await repository.updateAppointment(appointment);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      refresh();
      ref.watch(goRouterProvider).pop();
    }
  }
}
