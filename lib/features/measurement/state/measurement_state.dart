import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:measurement/measurement.dart';
import 'package:validators/validators.dart';

part 'measurement_state.freezed.dart';

@freezed
class MeasurementState with _$MeasurementState, FormzMixin {
  const factory MeasurementState({
    @Default(0) int id,
    @Default(NotNegativeIntNumber.pure()) NotNegativeIntNumber value,
    @Default(MeasurementType.bloodPressure) MeasurementType type,
    @Default(MeasurementUnit.mmHg) MeasurementUnit unit,
    DateTime? date,
    @Default(true) bool isEditing,
    @Default(true) bool isNew,
  }) = _MeasurementState;

  const MeasurementState._();

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [value];
}
