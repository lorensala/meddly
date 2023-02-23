part of 'measurement_bloc.dart';

/// {@template measurement_state}
/// MeasurementState description
/// {@endtemplate}
class MeasurementState {
  /// {@macro measurement_state}
  const MeasurementState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  /// Creates a copy of the current MeasurementState with property changes
  MeasurementState copyWith({
    String? customProperty,
  }) {
    return MeasurementState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template measurement_initial}
/// The initial state of MeasurementState
/// {@endtemplate}
class MeasurementInitial extends MeasurementState {
  /// {@macro measurement_initial}
  const MeasurementInitial() : super();
}
