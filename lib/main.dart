import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_skeleton/logic/blocs/app/app_bloc.dart';
import 'package:flutter_skeleton/ui/views/splash/splash_screen.dart';

import 'core/constants/env.dart';
import 'core/di/locator.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'push_notification_service.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.instance.initialize();

  runApp(MyApp());
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  await PushNotificationService().setupInteractedMessage();
}

class MyApp extends StatelessWidget {
  final AppBloc appBloc = ServiceLocator.instance.get<AppBloc>();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: appBloc,
      builder: (context, state) {
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
          locale: Locale(state.language == LanguageType.en ? 'en' : 'vi'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale == null) {
              return supportedLocales.first;
            }

            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode) {
                return supportedLocale;
              }
            }

            return supportedLocales.first;
          },
        );
      },
    );
  }
}
