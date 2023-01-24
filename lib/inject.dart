import 'package:authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meddly/core/core.dart';
import 'package:notifications/notifications.dart';
import 'package:user/user.dart';

Future<void> inject() async {
  final userBox = await Hive.openBox<UserDto>(userBoxKey);
  final notificationsBox =
      await Hive.openBox<List<NotificationPreferenceDto>>(preferencesBoxKey);

  GetIt.I
    // Dio
    ..registerLazySingleton<Dio>(Dio.new)
    // Caches
    ..registerLazySingleton<UserCache>(() => UserCache(userBox))
    ..registerLazySingleton<NotificationsCache>(
      () => NotificationsCache(notificationsBox),
    )
    // Api
    ..registerLazySingleton<UserApi>(
      () => UserApi(GetIt.I.get<Dio>(), baseUrl: Strings.baseUrl),
    )
    ..registerLazySingleton<NotificationsApi>(
      () => NotificationsApi(GetIt.I.get<Dio>(), baseUrl: Strings.baseUrl),
    )
    // Repositories
    ..registerLazySingleton(AuthRepository.new)
    ..registerLazySingleton<UserRepository>(
      () => UserRepository(
        api: GetIt.I.get<UserApi>(),
        cache: GetIt.I.get<UserCache>(),
      ),
    )
    ..registerLazySingleton<NotificationsRepository>(
      () => NotificationsRepository(
        api: GetIt.I.get<NotificationsApi>(),
        cache: GetIt.I.get<NotificationsCache>(),
      ),
    )
    ..get<Dio>().interceptors.addAll([
      AuthInterceptor(GetIt.I.get<AuthRepository>()),
      LogInterceptor(requestBody: true, responseBody: true)
    ]);
}
