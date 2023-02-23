part of 'measurement_bloc.dart';

abstract class MeasurementEvent  {
  const MeasurementEvent();
}

/// {@template custom_measurement_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomMeasurementEvent extends MeasurementEvent {
  /// {@macro custom_measurement_event}
  const CustomMeasurementEvent();


}
