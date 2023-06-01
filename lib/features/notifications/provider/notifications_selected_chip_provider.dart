import 'package:meddly/features/notifications/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_selected_chip_provider.g.dart';

@riverpod
class NotificationSelectedChip extends _$NotificationSelectedChip {
  @override
  NotificationFilter build() {
    return NotificationFilter.all;
  }

  // ignore: use_setters_to_change_properties
  void select(NotificationFilter type) {
    state = type;
  }
}
