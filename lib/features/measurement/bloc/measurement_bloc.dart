import 'dart:async';

import 'package:bloc/bloc.dart';
part 'measurement_event.dart';
part 'measurement_state.dart';

class MeasurementBloc extends Bloc<MeasurementEvent, MeasurementState> {
  MeasurementBloc() : super(const MeasurementInitial()) {
    on<CustomMeasurementEvent>(_onCustomMeasurementEvent);
  }

  FutureOr<void> _onCustomMeasurementEvent(
    CustomMeasurementEvent event,
    Emitter<MeasurementState> emit,
  ) {
    // TODO: Add Logic
  }
}
