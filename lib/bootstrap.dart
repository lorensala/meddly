import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:calendar/calendar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/firebase_options.dart';
import 'package:meddly/inject.dart';
import 'package:notifications/notifications.dart';
import 'package:user/user.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  await inject();

  await runZonedGuarded(
    () async => runApp(ProviderScope(child: await builder())),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
