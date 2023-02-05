part of 'medicine_bloc.dart';

/// {@template medicine_state}
/// MedicineState description
/// {@endtemplate}
class MedicineState {
  /// {@macro medicine_state}
  const MedicineState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  /// Creates a copy of the current MedicineState with property changes
  MedicineState copyWith({
    String? customProperty,
  }) {
    return MedicineState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template medicine_initial}
/// The initial state of MedicineState
/// {@endtemplate}
class MedicineInitial extends MedicineState {
  /// {@macro medicine_initial}
  const MedicineInitial() : super();
}
