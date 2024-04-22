import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _flutterNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static AndroidNotificationChannel? _channel;

  static Future<void> initializeNotification() async {
    if (_channel != null) return;

    _channel = const AndroidNotificationChannel('important_channel', 'High Importance Channel', importance: Importance.high);
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

    await _flutterNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(_channel as AndroidNotificationChannel);
    await _flutterNotificationsPlugin.initialize(initializationSettings);

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );
  }

  static void showNotification(RemoteMessage message) async {
    if (_channel == null) initializeNotification();

    RemoteNotification? notification = message.notification;
    AndroidNotification? androidNotification = message.notification?.android;

    print(message.data.toString());
    print(message.data.isEmpty);

    if (notification != null && androidNotification != null) {
      _flutterNotificationsPlugin.show(notification.hashCode, notification.title, message.data['subtitle'] ?? '', 
      NotificationDetails(
        android: AndroidNotificationDetails(
          (_channel as AndroidNotificationChannel).id, 
          (_channel as AndroidNotificationChannel).name, 
          channelDescription: (_channel as AndroidNotificationChannel).description,
          styleInformation: BigTextStyleInformation(
            notification.body ?? '',
          )
        )
      ));
    }
  }
}