import 'package:calendar/calendar.dart';
import 'package:meddly/features/measurement/controller/measurement_controller.dart';
import 'package:meddly/features/measurement/state/measurement_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'measurement_form_controller.g.dart';

@riverpod
class MeasurementFormController extends _$MeasurementFormController {
  @override
  MeasurementState build() {
    return MeasurementState();
  }

  void valueChanged(String value) {
    state = state.copyWith(value: NotNegativeIntNumber.dirty(value));
  }

  void typeChanged(MeasurementType? type) {
    if (type == null) return;
    if (type == state.type) return;
    state = state.copyWith(type: type);
  }

  void dateChanged(DateTime date) {
    state = state.copyWith(date: date);
  }

  void save() {
    final measurement = Measurement(
      date: state.date ?? DateTime.now(),
      type: state.type.name,
      value: double.parse(state.value.value),
      id: 0,
    );

    ref
        .watch(measurementControllerProvider.notifier)
        .createMeasurement(measurement);
  }
}
