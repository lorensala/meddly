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
