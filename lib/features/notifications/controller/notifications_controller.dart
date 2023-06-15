import 'package:meddly/features/notifications/provider/notifications_provider.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_controller.g.dart';

@Riverpod(keepAlive: true)
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
}
