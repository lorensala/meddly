import 'dart:async';

import 'package:bloc/bloc.dart';
part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc() : super(const MedicineInitial()) {
    on<CustomMedicineEvent>(_onCustomMedicineEvent);
  }

  FutureOr<void> _onCustomMedicineEvent(
    CustomMedicineEvent event,
    Emitter<MedicineState> emit,
  ) {
    // TODO: Add Logic
  }
}
