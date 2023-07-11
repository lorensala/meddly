import 'package:appointment/appointment.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:meddly/features/appointment/core/core.dart';
import 'package:meddly/features/appointment/provider/provider.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appointment_controller.g.dart';

@riverpod
class AppointmentController extends _$AppointmentController {
  @override
  FutureOr<List<Appointment>> build() async {
    final cancelToken = CancelToken();

    final repository = ref.watch(appointmentRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    ref.onDispose(cancelToken.cancel);

    final (err, appointments) =
        await repository.fectchAll(cancelToken: cancelToken);

    if (err != null) {
      throw Exception(err.describe(l10n));
    } else {
      appointments.sort((a, b) => b.date.compareTo(a.date));
      return appointments;
    }
  }

  void refresh() {
    state = const AsyncLoading();
    ref
      ..invalidate(calendarControllerProvider)
      ..invalidateSelf();
  }

  void reload() {
    ref
      ..invalidate(calendarControllerProvider)
      ..invalidateSelf();
  }

  Appointment? getAppointment(int id) {
    return state.when(
      data: (appointments) {
        return appointments.firstWhereOrNull((element) => element.id == id);
      },
      error: (_, __) => null,
      loading: () => null,
    );
  }

  Future<void> addAppointment(Appointment appointment) async {
    final cancelToken = CancelToken();

    state = const AsyncLoading();
    final repository = ref.watch(appointmentRepositoryProvider);

    ref.onDispose(cancelToken.cancel);

    final (err, _) =
        await repository.addAppointment(appointment, cancelToken: cancelToken);

    if (err != null) {
      state = AsyncError(err.toString(), StackTrace.current);
    } else {
      ref.read(goRouterProvider).go(SuccessPage.routeName);
      reload();
    }
  }

  Future<void> deleteAppointment(int id) async {
    final cancelToken = CancelToken();

    state = const AsyncLoading();

    final repository = ref.watch(appointmentRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    ref.onDispose(cancelToken.cancel);

    final (err, _) =
        await repository.deleteAppointment(id, cancelToken: cancelToken);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      reload();
    }
  }

  Future<void> updateAppointment(Appointment appointment) async {
    final cancelToken = CancelToken();

    state = const AsyncLoading();

    final repository = ref.watch(appointmentRepositoryProvider);
    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    ref.onDispose(cancelToken.cancel);

    final (err, _) = await repository.updateAppointment(
      appointment,
      cancelToken: cancelToken,
    );

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      reload();
      ref.watch(goRouterProvider).pop();
    }
  }
}
