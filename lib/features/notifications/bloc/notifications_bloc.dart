import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notifications/notifications.dart';

part 'notifications_bloc.freezed.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc({required NotificationsRepository notificationsRepository})
      : _notificationsRepository = notificationsRepository,
        super(const _Initial()) {
    on<_ListenNotificationPrefences>(_onListenNotificationPreferences);
    on<_AddNotificationPreference>(_onAddNotification);
    on<_RemoveNotificationPreference>(_onRemoveNotificationPreference);
    on<_FetchNotificationPreferences>(_onFetchNotificationPreferences);

    add(const _ListenNotificationPrefences());
  }

  FutureOr<void> _onFetchNotificationPreferences(
    _FetchNotificationPreferences event,
    Emitter<NotificationsState> emit,
  ) async {
    final possibleFailureOrPreferences =
        await _notificationsRepository.fetchAll();

    if (possibleFailureOrPreferences.isLeft()) {
      emit(
        _Error(
          (possibleFailureOrPreferences as Left<NotificationFailure, Unit>)
              .value,
        ),
      );
    }
  }

  FutureOr<void> _onRemoveNotificationPreference(
    _RemoveNotificationPreference event,
    Emitter<NotificationsState> emit,
  ) async {
    final notificationPreferences = state.notificationPreferences;

    if (notificationPreferences.isEmpty) {
      return;
    }

    final possibleFailureOrUnit =
        await _notificationsRepository.delete(event.notificationPreference);

    if (possibleFailureOrUnit.isLeft()) {
      emit(
        _Error(
          (possibleFailureOrUnit as Left<NotificationFailure, Unit>).value,
        ),
      );
    }
  }

  FutureOr<void> _onAddNotification(
    _AddNotificationPreference event,
    Emitter<NotificationsState> emit,
  ) async {
    final possibleFailureOrUnit =
        await _notificationsRepository.add(event.notificationPreference);

    if (possibleFailureOrUnit.isLeft()) {
      emit(
        _Error(
          (possibleFailureOrUnit as Left<NotificationFailure, Unit>).value,
        ),
      );
    }
  }

  FutureOr<void> _onListenNotificationPreferences(
    _ListenNotificationPrefences event,
    Emitter<NotificationsState> emit,
  ) async {
    await emit.forEach(
      _notificationsRepository.notificationPreferences,
      onData: (possibleFailureOrPreferences) =>
          possibleFailureOrPreferences.fold(
        _Error.new,
        _Loaded.new,
      ),
      onError: (error, _) {
        return const _Error(NotificationFailure.unknown());
      },
    );
  }

  final NotificationsRepository _notificationsRepository;
}
