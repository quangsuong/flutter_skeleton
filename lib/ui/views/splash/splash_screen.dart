import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_skeleton/core/route/route-name.dart';
import 'package:flutter_skeleton/core/constants/my_color.dart';
import 'package:flutter_skeleton/core/utils/my_images.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          systemNavigationBarColor: MyColor.transparentColor,
          statusBarColor: MyColor.transparentColor,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light));
      _navigateToHome();
    });
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    context.goNamed(RouteName.mainPage);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColor.transparentColor,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(5),
            child: Center(
              child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(MyImages.logo),
                    ),
                  )),
            ),
          )),
    );
  }
}
