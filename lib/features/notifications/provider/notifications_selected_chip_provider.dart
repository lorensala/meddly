import 'package:meddly/features/notifications/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_selected_chip_provider.g.dart';

@riverpod
class NotificationSelectedChip extends _$NotificationSelectedChip {
  @override
  NotificationChipType build() {
    return NotificationChipType.all;
  }

  void select(NotificationChipType type) {
    state = type;
  }
}
