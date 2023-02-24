import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:calendar/calendar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_bloc.freezed.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc({required CalendarRepository calendarRepository})
      : _repository = calendarRepository,
        super(const _Initial()) {
    on<_Watch>(_onWatch);
    on<_AddConsumption>(_onAddConsumption);
    on<_DeleteConsumption>(_onDeleteConsumption);
    on<_FetchAll>(_onFetchAll);

    add(const _Watch());
  }

  final CalendarRepository _repository;

  FutureOr<void> _onFetchAll(
    _FetchAll event,
    Emitter<CalendarState> emit,
  ) async {
    emit(const _Loading());

    final possibleFailureOrUnit = await _repository.fetchCalendar();

    possibleFailureOrUnit.fold(
      (failure) => emit(_Failure(failure: failure)),
      (_) {},
    );
  }

  FutureOr<void> _onWatch(_Watch event, Emitter<CalendarState> emit) async {
    await emit.forEach(
      _repository.events,
      onData: (possibleFailureOrEvents) {
        return possibleFailureOrEvents.fold(
          (failure) => _Failure(failure: failure),
          (events) => events.isEmpty
              ? const _Initial()
              : _Success(
                  events: events,
                ),
        );
      },
    );
  }

  FutureOr<void> _onAddConsumption(
    _AddConsumption event,
    Emitter<CalendarState> emit,
  ) async {
    final possibleFailureOrUnit = await _repository.addConsumption(
      event.consumption,
    );

    possibleFailureOrUnit.fold(
      (failure) => emit(_Failure(failure: failure)),
      (_) {},
    );
  }

  FutureOr<void> _onDeleteConsumption(
    _DeleteConsumption event,
    Emitter<CalendarState> emit,
  ) async {
    final possibleFailureOrUnit = await _repository.deleteConsumption(
      event.consumption,
    );

    possibleFailureOrUnit.fold(
      (failure) => emit(_Failure(failure: failure)),
      (_) {},
    );
  }
}
