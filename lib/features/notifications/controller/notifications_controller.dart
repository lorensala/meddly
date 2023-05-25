import 'package:meddly/features/notifications/core/extension.dart';
import 'package:meddly/features/notifications/provider/provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_controller.g.dart';

@riverpod
class NotificationsController extends _$NotificationsController {
  @override
  Future<void> build() async {
    final repository = ref.read(notificationsRepositoryProvider);

    await repository.fetchAll();
  }

  void refresh() {
    ref.invalidateSelf();
  }

  Future<void> addNotificationPreference(
      NotificationPreference notificationPreference,) async {
    state = const AsyncLoading();
    final repository = ref.read(notificationsRepositoryProvider);

    final res = await repository.add(notificationPreference);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    res.fold(
      (failure) =>
          state = AsyncError(failure.message(l10n), StackTrace.current),
      (_) => state = const AsyncData(null),
    );
  }

  Future<void> deleteNotificationPreference(
      NotificationPreference notificationPreference,) async {
    state = const AsyncLoading();
    final repository = ref.read(notificationsRepositoryProvider);

    final res = await repository.delete(notificationPreference);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    res.fold(
      (failure) =>
          state = AsyncError(failure.message(l10n), StackTrace.current),
      (_) => state = const AsyncData(null),
    );
  }
}
