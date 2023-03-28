import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:medicine/medicine.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return Dio()
    ..options.baseUrl = Strings.baseUrl
    ..interceptors.addAll([
      AuthInterceptor(authRepository),
      LogInterceptor(requestBody: true, responseBody: true)
    ]);
}

@riverpod
Future<HiveInterface> hive(HiveRef ref) async {
  final hive = Hive;
  await hive.initFlutter();

  await hive.openBox<UserDto>(userBoxKey);
  await hive.openBox<List<String>>(preferencesBoxKey);
  await hive.openBox<List<MedicineDto>>(medicineBoxKey);

  return hive;
}

@riverpod
Box<UserDto> userBox(UserBoxRef ref) {
  final hive = ref.read(hiveProvider).requireValue;
  return hive.box<UserDto>(userBoxKey);
}

@riverpod
Box<List<String>> preferencesBox(PreferencesBoxRef ref) {
  final hive = ref.read(hiveProvider).requireValue;
  return hive.box<List<String>>(preferencesBoxKey);
}

@riverpod
Box<List<MedicineDto>> medicineBox(MedicineBoxRef ref) {
  final hive = ref.read(hiveProvider).requireValue;
  return hive.box<List<MedicineDto>>(medicineBoxKey);
}
