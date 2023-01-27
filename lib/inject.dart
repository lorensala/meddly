import 'package:authentication/authentication.dart';
import 'package:calendar/calendar.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meddly/core/core.dart';
import 'package:notifications/notifications.dart';
import 'package:predictions/predictions.dart';
import 'package:user/user.dart';

Future<void> inject() async {
  final userBox = await Hive.openBox<UserDto>(userBoxKey);
  final notificationsBox = await Hive.openBox<List<String>>(preferencesBoxKey);
  final calendarBox = await Hive.openBox<CalendarDto>(calendarBoxKey);

  GetIt.I
    // * Dio * //
    ..registerLazySingleton<Dio>(Dio.new)

    // * User * //
    ..registerLazySingleton<UserCache>(() => UserCache(userBox))
    ..registerLazySingleton<NotificationsCache>(
      () => NotificationsCache(notificationsBox),
    )
    ..registerLazySingleton<UserApi>(
      () => UserApi(GetIt.I.get<Dio>(), baseUrl: Strings.baseUrl),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepository(
        api: GetIt.I.get<UserApi>(),
        cache: GetIt.I.get<UserCache>(),
      ),
    )

    // * Auth * //
    ..registerLazySingleton(AuthRepository.new)

    // * Calendar * //
    ..registerLazySingleton<CalendarCache>(
      () => CalendarCache(
        box: calendarBox,
      ),
    )
    ..registerLazySingleton<CalendarApi>(
      () => CalendarApi(GetIt.I.get<Dio>(), baseUrl: Strings.baseUrl),
    )
    ..registerLazySingleton<CalendarRepository>(
      () => CalendarRepository(
        api: GetIt.I.get<CalendarApi>(),
        cache: GetIt.I.get<CalendarCache>(),
      ),
    )

    // * Notifications * //
    ..registerLazySingleton<NotificationsApi>(
      () => NotificationsApi(GetIt.I.get<Dio>(), baseUrl: Strings.baseUrl),
    )
    ..registerLazySingleton<NotificationsRepository>(
      () => NotificationsRepository(
        api: GetIt.I.get<NotificationsApi>(),
        cache: GetIt.I.get<NotificationsCache>(),
      ),
    )

    // * Predictions * //
    ..registerLazySingleton<PredictionsApi>(
      () => PredictionsApi(GetIt.I.get<Dio>(), baseUrl: Strings.baseUrl),
    )
    ..registerLazySingleton<PredictionsRepository>(
      () => PredictionsRepository(
        api: GetIt.I.get<PredictionsApi>(),
      ),
    )
    // * Core * //
    ..get<Dio>().interceptors.addAll([
      AuthInterceptor(GetIt.I.get<AuthRepository>()),
      LogInterceptor(requestBody: true, responseBody: true)
    ]);
}
