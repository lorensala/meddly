import 'package:measurement/measurement.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
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

@riverpod
String? measurementValueError(MeasurementValueErrorRef ref) {
  final value = ref
      .watch(measurementFormControllerProvider.select((value) => value.value));
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !value.isPure && value.isNotValid
      ? l10n.invalidMeasurementValue
      : null;
}

@riverpod
bool measurementIsValid(MeasurementIsValidRef ref) {
  final value = ref
      .watch(measurementFormControllerProvider.select((value) => value.value));
  final date = ref
      .watch(measurementFormControllerProvider.select((value) => value.date));

  return value.isValid && value.value.isNotEmpty && date != null;
}

@riverpod
Measurement measurement(MeasurementRef ref) {
  throw UnimplementedError();
}
