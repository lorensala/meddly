import 'package:measurement/measurement.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'measurement_provider.g.dart';

@riverpod
MeasurementApi measurementApi(MeasurementApiRef ref) {
  return MeasurementApi(ref.read(dioProvider));
}

@riverpod
MeasurementRepository measurementRepository(MeasurementRepositoryRef ref) {
  return MeasurementRepository(api: ref.watch(measurementApiProvider));
}

@Riverpod(dependencies: [MeasurementFormController])
bool measurementIsValid(MeasurementIsValidRef ref) {
  final value = ref
      .watch(measurementFormControllerProvider.select((value) => value.value));
  final date = ref
      .watch(measurementFormControllerProvider.select((value) => value.date));

  return value.isValid && value.value.isNotEmpty && date != null;
}

@Riverpod(dependencies: [])
Measurement measurement(MeasurementRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [])
Measurement? existingMeasurement(ExistingMeasurementRef ref) {
  return null;
}

@riverpod
List<Measurement> filteredMeasurements(
  FilteredMeasurementsRef ref,
) {
  final measurements = ref.watch(measurementControllerProvider);
  final filtersSelected = ref.watch(measurementTypesProvider);

  return measurements.when(
    data: (data) {
      return data.where((element) {
        return filtersSelected.contains(element.type);
      }).toList();
    },
    error: (_, __) => [],
    loading: () => [],
  );
}

@riverpod
class MeasurementTypes extends _$MeasurementTypes {
  @override
  List<MeasurementType> build() {
    return MeasurementType.values;
  }

  void select(MeasurementType type) {
    state = [...state, type];
  }

  void deselect(MeasurementType type) {
    state = state.where((element) => element != type).toList();
  }

  void clear() {
    state = [];
  }
}
