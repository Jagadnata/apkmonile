import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'app/routes/app_pages.dart';

// Handler untuk pesan Firebase ketika aplikasi berada di background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Setup handler pesan background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Inisialisasi layanan notifikasi saat aplikasi dibuka
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Minta izin notifikasi
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else {
    print('User declined or has not accepted permission');
  }

  // Handler notifikasi saat aplikasi di foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message notification: ${message.notification}');
    }
  });

  // Handler ketika aplikasi dibuka melalui notifikasi
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Notification opened the app!');
  });

  // Mendapatkan token FCM
  String? token = await messaging.getToken();
  print("FCM Token: $token");

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
