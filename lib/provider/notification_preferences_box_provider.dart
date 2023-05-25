import 'package:hive_flutter/hive_flutter.dart';
import 'package:meddly/provider/provider.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_preferences_box_provider.g.dart';

@riverpod
Box<List<String>> notificationPreferencesBox(
    NotificationPreferencesBoxRef ref,) {
  final hive = ref.read(hiveProvider);
  return hive.box<List<String>>(preferencesBoxKey);
}
