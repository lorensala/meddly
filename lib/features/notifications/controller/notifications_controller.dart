import 'package:meddly/features/notifications/core/core.dart';
import 'package:meddly/features/notifications/provider/notifications_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_controller.g.dart';

@riverpod
class NotificationsController extends _$NotificationsController {
  @override
  Future<List<Notification>> build() async {
    final repository = ref.read(notificationsRepositoryProvider);

    final (err, notifications) = await repository.fetchAll();

    if (err != null) {
      throw err;
    } else {
      return notifications;
    }
  }

  Future<void> delete(Notification notification) async {
    final repository = ref.read(notificationsRepositoryProvider);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (err, _) = await repository.deleteNotification(notification);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      state = AsyncData(
        state.asData!.value
          ..removeWhere((element) => element.id == notification.id),
      );
    }
  }
}
