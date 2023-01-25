part of 'notifications_bloc.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _Initial;
  const factory NotificationsState.loading() = _Loading;
  const factory NotificationsState.loaded(
    List<NotificationPreference> notificationPreferences,
  ) = _Loaded;
  const factory NotificationsState.error(
    NotificationFailure failure,
  ) = _Error;

  const NotificationsState._();

  List<NotificationPreference> get notificationPreferences =>
      maybeWhen<List<NotificationPreference>>(
        orElse: () => [],
        loaded: (notificationPreferences) => notificationPreferences,
      );
}
