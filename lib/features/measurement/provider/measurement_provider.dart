import 'package:measurement/measurement.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

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
MeasurementType measurementType(MeasurementTypeRef ref) {
  return ref.watch(measurementFormControllerProvider).type;
}

@riverpod
NotNegativeIntNumber measurementValue(MeasurementValueRef ref) {
  return ref.watch(measurementFormControllerProvider).value;
}

@riverpod
DateTime? measurementDate(MeasurementDateRef ref) {
  return ref.watch(measurementFormControllerProvider).date;
}

@riverpod
String? measurementValueError(MeasurementValueErrorRef ref) {
  final value = ref.watch(measurementValueProvider);
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !value.pure && value.invalid ? l10n.invalidMeasurementValue : null;
}

@riverpod
bool measurementIsValid(MeasurementIsValidRef ref) {
  final value = ref.watch(measurementValueProvider);
  final date = ref.watch(measurementDateProvider);

  return value.valid && value.value.isNotEmpty && date != null;
}
