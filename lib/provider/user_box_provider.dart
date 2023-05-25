import 'package:hive_flutter/hive_flutter.dart';
import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'user_box_provider.g.dart';

@riverpod
Box<UserDto> userBox(UserBoxRef ref) {
  final hive = ref.read(hiveProvider);
  return hive.box<UserDto>(userBoxKey);
}
