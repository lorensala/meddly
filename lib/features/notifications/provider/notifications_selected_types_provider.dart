import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_selected_types_provider.g.dart';

@riverpod
class NotificationSelectedTypes extends _$NotificationSelectedTypes {
  static const List<NotificationType> _initialState = NotificationType.values;

  @override
  List<NotificationType> build() {
    return _initialState;
  }

  // ignore: use_setters_to_change_properties
  void select(NotificationType type) {
    state = [...state, type];
  }

  void unselect(NotificationType type) {
    if (state.length == 1) return;

    state = state.where((e) => e != type).toList();
  }
}
