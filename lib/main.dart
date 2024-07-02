import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/constants/env.dart';
import 'package:flutter_skeleton/view/screens/splash/splash_screen.dart';

import 'firebase_options.dart';
import 'push_notification_service.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  runApp(const MyApp());
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  await PushNotificationService().setupInteractedMessage();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Env.name,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) => Env.name != Envs.PRODUCTION
          ? Env.name.isNotEmpty
              ? Banner(
                  message: Env.name.toString(),
                  textDirection: TextDirection.ltr,
                  location: BannerLocation.topStart,
                  child: child,
                )
              : Banner(
                  message: "ENVLESS",
                  textDirection: TextDirection.ltr,
                  location: BannerLocation.topStart,
                  child: child,
                )
          : child!,
      home: const SplashScreen(),
    );
  }
}
