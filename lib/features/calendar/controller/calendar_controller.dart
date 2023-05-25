import 'package:calendar/calendar.dart';
import 'package:dartz/dartz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_controller.g.dart';

@riverpod
class CalendarController extends _$CalendarController {
  @override
  Future<Either<CalendarFailure, List<CalendarEvent>>> build() async {
    state = const AsyncLoading();
    final repository = ref.read(calendarRepositoryProvider);

    return repository.fetchCalendar();
  }

  void refresh() {
    ref.invalidateSelf();
  }

  Future<void> addConsumption(Consumption consumption) async {
    final repository = ref.read(calendarRepositoryProvider);
    final res = await repository.addConsumption(consumption);

    if (res.isLeft()) {
      state = AsyncError(res.asLeft(), StackTrace.current);
    } else {
      ref.invalidateSelf();
    }
  }

  Future<void> deleteConsumption(Consumption consumption) async {
    final repository = ref.read(calendarRepositoryProvider);
    final res = await repository.removeConsumption(consumption);

    if (res.isLeft()) {
      state = AsyncError(res.asLeft(), StackTrace.current);
    } else {
      ref.invalidateSelf();
    }
  }
}
