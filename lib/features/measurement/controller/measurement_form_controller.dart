import 'package:measurement/measurement.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'measurement_form_controller.g.dart';

@Riverpod(dependencies: [existingMeasurement])
class MeasurementFormController extends _$MeasurementFormController {
  @override
  MeasurementState build() {
    final existingMeasurement = ref.watch(existingMeasurementProvider);

    if (existingMeasurement != null) {
      return MeasurementState(
        id: existingMeasurement.id,
        date: existingMeasurement.date,
        type: existingMeasurement.type,
        unit: existingMeasurement.unit,
        value: NotNegativeIntNumber.dirty(
          existingMeasurement.value.toInt().toString(),
        ),
        isEditing: false,
        isNew: false,
      );
    } else {
      return const MeasurementState();
    }
  }

  void valueChanged(String value) {
    state = state.copyWith(value: NotNegativeIntNumber.dirty(value));
  }

  void unitChanged(MeasurementUnit? unit) {
    if (unit == null) return;
    state = state.copyWith(unit: unit);
  }

  void typeChanged(MeasurementType? type) {
    if (type == null) return;

    state = state.copyWith(
      type: type,
      unit: type.units.isEmpty ? MeasurementUnit.other : type.units.first,
    );
  }

  void dateChanged(DateTime date) {
    state = state.copyWith(date: date);
  }

  void edit() {
    state = state.copyWith(isEditing: true);
  }

  void save() {
    if (state.isNotValid) return;

    final measurement = Measurement(
      id: state.id,
      date: state.date ?? DateTime.now(),
      type: state.type,
      value: double.parse(state.value.value),
      unit: state.unit,
    );

    if (state.isNew) {
      ref
          .watch(measurementControllerProvider.notifier)
          .createMeasurement(measurement);
    } else {
      ref
          .watch(measurementControllerProvider.notifier)
          .updateMeasurement(measurement);
    }
  }
}
