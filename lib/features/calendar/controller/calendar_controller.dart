import 'package:appointment/appointment.dart';
import 'package:calendar/calendar.dart';
import 'package:measurement/measurement.dart';
import 'package:meddly/features/calendar/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_controller.g.dart';

@Riverpod(keepAlive: true)
class CalendarController extends _$CalendarController {
  @override
  Future<List<UserCalendar>> build() async {
    final repository = ref.read(calendarRepositoryProvider);
    final selected = ref.read(selectedSupervisedProvider);
    final usersIds = selected.map((e) => e.uid).toList();

    final (err, calendar) = await repository.fetchCalendar(usersIds);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      throw Exception(err.describe(l10n));
    }
    return calendar;
  }

  void refresh() {
    state = const AsyncLoading();
    ref.invalidateSelf();
  }

  Future<void> addConsumption(Consumption consumption) async {
    final repository = ref.read(calendarRepositoryProvider);
    final (err, _) = await repository.addConsumption(consumption);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref.invalidateSelf();
    }
  }

  Future<void> deleteConsumption(Consumption consumption) async {
    final repository = ref.read(calendarRepositoryProvider);
    final (err, _) = await repository.removeConsumption(consumption);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref.invalidateSelf();
    }
  }
}
