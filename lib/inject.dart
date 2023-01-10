import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user/user.dart';

Future<void> inject() async {
  final userBox = await Hive.openBox<Map<String, dynamic>>(userBoxKey);

  GetIt.I
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton<UserCache>(() => UserCache(userBox))
    ..registerLazySingleton<UserApi>(() => UserApi(GetIt.I.get<Dio>()))
    ..registerLazySingleton(AuthRepository.new)
    ..registerLazySingleton<UserRepository>(
      () => UserRepository(
        api: GetIt.I.get<UserApi>(),
        cache: GetIt.I.get<UserCache>(),
      ),
    );
}
