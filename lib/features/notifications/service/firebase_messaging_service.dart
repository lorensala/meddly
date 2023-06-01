import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/firebase_options.dart';

class FirebaseMessagingService {
  FirebaseMessagingService({
    required this.localNotificationService,
  });

  final _firebaseMessaging = FirebaseMessaging.instance;
  final LocalNotificationService localNotificationService;

  Future<void> _onMessageRecieved(RemoteMessage message) async {
    await localNotificationService.showNotification(
      id: int.tryParse(message.messageId ?? '') ?? 0,
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: message.data.toString(),
    );
  }

  Future<String?> getToken() async {
    final token = await _firebaseMessaging.getToken();
    return token;
  }

  Future<void> _onMessageOpenedApp(RemoteMessage message) async {
    // navigate to a page...?
  }

  Future<void> initializeApp() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen(_onMessageRecieved);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final localNotificationService = LocalNotificationService();

  await localNotificationService.initialize();

  await localNotificationService.showNotification(
    id: int.tryParse(message.messageId ?? '') ?? 0,
    title: message.notification?.title ?? '',
    body: message.notification?.body ?? '',
    payload: message.data.toString(),
  );
}
