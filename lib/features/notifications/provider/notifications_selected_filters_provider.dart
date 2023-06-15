import 'package:meddly/features/notifications/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_selected_filters_provider.g.dart';

@riverpod
class NotificationSelectedFilters extends _$NotificationSelectedFilters {
  static const List<NotificationFilter> _initialState =
      NotificationFilter.values;

  @override
  List<NotificationFilter> build() {
    return _initialState;
  }

  // ignore: use_setters_to_change_properties
  void select(NotificationFilter type) {
    state = [...state, type];
  }

  void unselect(NotificationFilter type) {
    if (state.length == 1) return;

    state = state.where((e) => e != type).toList();
  }
}
