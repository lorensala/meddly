import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/firebase_options.dart';
import 'package:meddly/log/logger.dart';
import 'package:meddly/provider/provider.dart';
import 'package:medicine/medicine.dart';
import 'package:notifications/notifications.dart';
import 'package:user/user.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();

  final hive = Hive;
  await hive.initFlutter();
  hive
    ..registerAdapter<UserDto>(UserDtoAdapter())
    ..registerAdapter<MedicineDto>(MedicineDtoAdapter());

  await Future.wait<dynamic>([
    hive.openBox<UserDto>(userBoxKey),
    hive.openBox<List<String>>(preferencesBoxKey),
    hive.openBox<List<MedicineDto>>(medicineBoxKey),
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await runZonedGuarded(
    () async => runApp(
      ProviderScope(
        overrides: [
          hiveProvider.overrideWithValue(hive),
        ],
        observers: [Logger()],
        child: await builder(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
