import 'package:firebase_core/firebase_core.dart';
import 'package:try_get/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:try_get/utils/notification_service.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService.showNotification(message);
}
