import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/firebase_options.dart';
import 'package:meddly/log/logger.dart';
import 'package:meddly/provider/provider.dart';
import 'package:notifications/notifications.dart';
import 'package:user/user.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final localNotificationService = LocalNotificationService();
      final firebaseMessaginService = FirebaseMessagingService(
        localNotificationService: localNotificationService,
      );

      await localNotificationService.initialize();
      await firebaseMessaginService.initializeApp();
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      //TODO(me): svg precache

      final hive = Hive;
      await hive.initFlutter();
      hive.registerAdapter<UserDto>(UserDtoAdapter());

      await Future.wait<dynamic>([
        hive.openBox<UserDto>(userBoxKey),
        hive.openBox<List<String>>(preferencesBoxKey),
      ]);

      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };

      runApp(
        ProviderScope(
          overrides: [
            hiveProvider.overrideWithValue(hive),
            localNotificationServiceProvider
                .overrideWithValue(localNotificationService),
            firebaseMessagingServiceProvider
                .overrideWithValue(firebaseMessaginService),
          ],
          observers: [Logger()],
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
