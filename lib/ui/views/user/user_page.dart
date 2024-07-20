// lib/presentation/pages/settings_page.dart

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/my_animations.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Lottie.asset(MyAnimations.noResult),
        ),
      ),
    );
  }
}
