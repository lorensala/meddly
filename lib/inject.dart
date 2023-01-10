import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user/user.dart';

void inject() {
  final userBox = Hive.box<Map<String, dynamic>>(userBoxKey);

  GetIt.I
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton<UserCache>(() => UserCache(userBox))
    ..registerLazySingleton<UserApi>(() => UserApi(GetIt.I.get<Dio>()))
    ..registerLazySingleton<UserRepository>(
      () => UserRepository(
        api: GetIt.I.get<UserApi>(),
        cache: GetIt.I.get<UserCache>(),
      ),
    );
}
