import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'predictions_bloc.freezed.dart';
part 'predictions_event.dart';
part 'predictions_state.dart';

class PredictionsBloc extends Bloc<PredictionsEvent, PredictionsState> {
  PredictionsBloc() : super(const _Initial()) {
    on<PredictionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
