import 'package:dartz/dartz.dart';
import 'package:meddly/provider/provider.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_provider.g.dart';

@riverpod
NotificationsCache notificationsCache(NotificationsCacheRef ref) {
  return NotificationsCache(ref.read(notificationPreferencesBoxProvider));
}

@Riverpod(dependencies: [])
NotificationPreference notificationPreference(NotificationPreferenceRef ref) {
  throw UnimplementedError();
}

@riverpod
bool isNotificationPreferenceOn(IsNotificationPreferenceOnRef ref,
    {required NotificationPreference preference}) {
  final notificationPreferences = ref.watch(notificationPreferencesProvider);

  return notificationPreferences.when(
    data: (preferences) {
      return preferences.contains(preference);
    },
    error: (error, stackTrace) {
      return false;
    },
    loading: () {
      return false;
    },
  );
}

@riverpod
NotificationsApi notificationsApi(NotificationsApiRef ref) {
  return NotificationsApi(ref.read(dioProvider));
}

@riverpod
NotificationsRepository notificationsRepository(
    NotificationsRepositoryRef ref) {
  return NotificationsRepository(
      api: ref.read(notificationsApiProvider),
      cache: ref.read(notificationsCacheProvider));
}

@riverpod
Stream<Either<NotificationFailure, List<NotificationPreference>>>
    notificationPreferencesStream(NotificationPreferencesStreamRef ref) {
  final repository = ref.read(notificationsRepositoryProvider);
  return repository.notificationPreferences;
}

@riverpod
AsyncValue<List<NotificationPreference>> notificationPreferences(
    NotificationPreferencesRef ref) {
  return ref.watch(notificationPreferencesStreamProvider).when(
        data: (data) => data.fold(
          (failure) => AsyncError(failure, StackTrace.current),
          (data) => AsyncData(data),
        ),
        error: (error, stackTrace) {
          return AsyncError(error, stackTrace);
        },
        loading: () {
          return const AsyncLoading();
        },
      );
}
