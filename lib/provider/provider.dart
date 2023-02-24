import 'package:authentication/authentication.dart';
import 'package:calendar/calendar.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return Dio()
    ..options.baseUrl = 'http://localhost:11001'
    ..interceptors.addAll([
      AuthInterceptor(authRepository),
      LogInterceptor(requestBody: true, responseBody: true)
    ]);
}

@riverpod
Future<void> initHive(InitHiveRef ref) async {
  await Hive.initFlutter();

  Hive
    ..registerAdapter(UserDtoAdapter())
    ..registerAdapter(CalendarDtoAdapter())
    ..registerAdapter(ConsumptionDtoAdapter())
    ..registerAdapter(MedicineDtoAdapter())
    ..registerAdapter(MeasurementDtoAdapter())
    ..registerAdapter(AppointmentDtoAdapter());

  await Hive.openBox<UserDto>(userBoxKey);
  await Hive.openBox<List<String>>(preferencesBoxKey);
  await Hive.openBox<CalendarDto>(calendarBoxKey);
  await Hive.openBox<MedicineDto>(medicineBoxKey);
}

@riverpod
Box<UserDto> userBox(UserBoxRef ref) {
  return Hive.box<UserDto>(userBoxKey);
}

@riverpod
Box<List<String>> preferencesBox(PreferencesBoxRef ref) {
  return Hive.box<List<String>>(preferencesBoxKey);
}

@riverpod
Box<CalendarDto> calendarBox(CalendarBoxRef ref) {
  return Hive.box<CalendarDto>(calendarBoxKey);
}

@riverpod
Box<MedicineDto> medicineBox(MedicineBoxRef ref) {
  return Hive.box<MedicineDto>(medicineBoxKey);
}
