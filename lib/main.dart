import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_skeleton/core/utils/localization.dart';
import 'package:flutter_skeleton/logic/blocs/app/lang/language_bloc.dart';
import 'package:flutter_skeleton/logic/blocs/app/theme/theme_bloc.dart';
import 'package:flutter_skeleton/logic/blocs/app/theme/theme_event.dart';
import 'package:flutter_skeleton/ui/views/splash/splash_screen.dart';
import 'package:flutter_skeleton/ui/widgets/GlobalDialog.dart';

import 'core/constants/env.dart';
import 'core/constants/theme.dart';
import 'core/di/locator.dart';
import 'core/utils/navigator.dart';
import 'firebase_options.dart';
import 'logic/blocs/app/theme/theme_state.dart';
import 'logic/blocs/dialog/dialog_bloc.dart';
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
  final LanguageBloc languageBloc = ServiceLocator.instance.get<LanguageBloc>();
  final ThemeBloc themeBloc = ServiceLocator.instance.get<ThemeBloc>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    languageBloc.add(LoadLanguage());
    themeBloc.add(LoadTheme());
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(create: (context) => themeBloc),
          BlocProvider<LanguageBloc>(
            create: (context) => languageBloc,
          ),
          BlocProvider<DialogBloc>(
            create: (context) => DialogBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                return MaterialApp(
                  navigatorKey: navigatorKey,
                  title: Env.name,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: themeState is DarkThemeState
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  builder: (context, child) => GlobalDialog(
                    child: Env.name != Envs.PRODUCTION
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
                  ),
                  home: const SplashScreen(),
                  locale: Locale(state.locale),
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
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
          },
        ));
  }
}
