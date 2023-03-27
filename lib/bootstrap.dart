import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/firebase_options.dart';
import 'package:medicine/medicine.dart';
import 'package:notifications/notifications.dart';
import 'package:user/user.dart';

import 'log/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  Hive
    ..registerAdapter(UserDtoAdapter())
    ..registerAdapter(MedicineDtoAdapter());

  await Hive.openBox<UserDto>(userBoxKey);
  await Hive.openBox<List<String>>(preferencesBoxKey);
  // await Hive.openBox<MedicineDto>(medicineBoxKey);

  await runZonedGuarded(
    () async =>
        runApp(ProviderScope(observers: [Logger()], child: await builder())),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
