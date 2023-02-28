import 'package:calendar/calendar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'measurement_state.freezed.dart';

@freezed
class MeasurementState with _$MeasurementState {
  const factory MeasurementState({
    @Default(NotNegativeIntNumber.pure()) NotNegativeIntNumber value,
    @Default(MeasurementType.bloodGlucose) MeasurementType type,
    DateTime? date,
  }) = _MeasurementState;
}
