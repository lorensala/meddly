import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/provider/medicine_provider.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/firebase_options.dart';
import 'package:meddly/log/logger.dart';
import 'package:meddly/provider/provider.dart';
import 'package:medicine/medicine.dart';
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

      const pdf = SvgAssetLoader(Vectors.pdf);
      const logout = SvgAssetLoader(Vectors.logout);
      const changePassword = SvgAssetLoader(Vectors.changePassword);
      const userData = SvgAssetLoader(Vectors.userData);
      const about = SvgAssetLoader(Vectors.about);
      const moon = SvgAssetLoader(Vectors.moon);
      const sun = SvgAssetLoader(Vectors.sun);
      const userEdit = SvgAssetLoader(Vectors.userEdit);

      const vectors = [
        pdf,
        logout,
        changePassword,
        userData,
        about,
        moon,
        sun,
        userEdit
      ];

      for (final vector in vectors) {
        await svg.cache
            .putIfAbsent(vector.cacheKey(null), () => vector.loadBytes(null));
      }

      final hive = Hive;
      await hive.initFlutter();
      hive.registerAdapter<UserDto>(UserDtoAdapter());
      final medicineBox = await hive.openBox<String>(medicineBoxKey);

      await Future.wait<dynamic>([
        hive.openBox<UserDto>(userBoxKey),
        hive.openBox<String>(preferencesBoxKey),
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
            medicineBoxProvider.overrideWithValue(medicineBox),
          ],
          observers: [Logger()],
          child: await builder(),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
