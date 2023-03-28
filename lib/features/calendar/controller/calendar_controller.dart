import 'package:calendar/calendar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_controller.g.dart';

@riverpod
class CalendarController extends _$CalendarController {
  @override
  FutureOr<void> build() {}

  void refresh() {
    return null;
    // return ref.read(calendarRepositoryProvider).fetchCalendar();
  }

  Future<void> addConsumption(Consumption consumption) async {
    //   final repository = ref.read(calendarRepositoryProvider);
    //   final res = await repository.addConsumption(
    //     consumption,
    //   );

    //   if (res.isLeft()) {
    //     state = AsyncError(res.asLeft(), StackTrace.current);
    //   }
    // }

    // Future<void> deleteConsumption(Consumption consumption) async {
    //   final repository = ref.read(calendarRepositoryProvider);
    //   final res = await repository.deleteConsumption(
    //     consumption,
    //   );

    //   if (res.isLeft()) {
    //     state = AsyncError(res.asLeft(), StackTrace.current);
    //   }
  }
}
