import 'package:meddly/features/notifications/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_preferences_controller.g.dart';

@riverpod
class NotificationPreferencesController
    extends _$NotificationPreferencesController {
  @override
  Stream<List<NotificationPreference>> build() {
    final repository = ref.read(notificationsRepositoryProvider);

    return repository.notificationPreferences;
  }

  Future<void> addNotificationPreference(
    NotificationPreference notificationPreference,
  ) async {
    final repository = ref.read(notificationsRepositoryProvider);

    final (err, _) = await repository.add(notificationPreference);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
  }

  Future<void> deleteNotificationPreference(
    NotificationPreference notificationPreference,
  ) async {
    state = const AsyncLoading();
    final repository = ref.read(notificationsRepositoryProvider);

    final (err, _) = await repository.delete(notificationPreference);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
  }
}
