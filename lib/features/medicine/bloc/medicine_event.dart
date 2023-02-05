part of 'medicine_bloc.dart';

abstract class MedicineEvent  {
  const MedicineEvent();
}

/// {@template custom_medicine_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomMedicineEvent extends MedicineEvent {
  /// {@macro custom_medicine_event}
  const CustomMedicineEvent();


}
