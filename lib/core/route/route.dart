// GoRouter configuration
import 'package:flutter_skeleton/core/route/route-name.dart';
import 'package:flutter_skeleton/core/utils/navigator.dart';
import 'package:flutter_skeleton/ui/views/home/home_page_screen.dart';
import 'package:flutter_skeleton/ui/views/main_page.dart';
import 'package:flutter_skeleton/ui/views/saved_item/saved_item.dart';
import 'package:flutter_skeleton/ui/views/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
          name: RouteName.mainPage,
          path: '/',
          builder: (context, state) => const MainPage(),
          routes: [
            GoRoute(
                name: RouteName.homePage,
                path: 'home-page',
                builder: (context, state) => HomePage(),
                routes: [
                  GoRoute(
                      name: RouteName.saveName,
                      path: 'save-name',
                      builder: (context, state) => SavedItem())
                ]),
          ]),
      GoRoute(
          name: RouteName.splash,
          path: '/splash',
          builder: (context, state) => const SplashScreen())
    ],
  );
}
