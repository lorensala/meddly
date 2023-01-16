import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meddly/core/core.dart';
import 'package:user/user.dart';

Future<void> inject() async {
  final userBox = await Hive.openBox<UserDto>(userBoxKey);

  GetIt.I
    ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton<UserCache>(() => UserCache(userBox))
    ..registerLazySingleton<UserApi>(
      () => UserApi(GetIt.I.get<Dio>(), baseUrl: Strings.baseUrl),
    )
    ..registerLazySingleton(AuthRepository.new)
    ..registerLazySingleton<UserRepository>(
      () => UserRepository(
        api: GetIt.I.get<UserApi>(),
        cache: GetIt.I.get<UserCache>(),
      ),
    )
    ..get<Dio>().interceptors.addAll([
      AuthInterceptor(GetIt.I.get<AuthRepository>()),
      LogInterceptor(requestBody: true, responseBody: true)
    ]);
}
