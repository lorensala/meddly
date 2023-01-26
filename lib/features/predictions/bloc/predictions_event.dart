part of 'predictions_bloc.dart';

@freezed
class PredictionsEvent with _$PredictionsEvent {
  const factory PredictionsEvent.started() = _Started;
}
