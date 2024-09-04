import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/core/utils/locale_support.dart';
import 'package:flutter_skeleton/ui/views/login/login_view.dart';
import 'package:flutter_skeleton/ui/views/settings/settings_page.dart';

import '../../core/utils/my_color.dart';
import 'home/home_page_screen.dart';
import 'user/user_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _fcmToken = 'Fetching token...';
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    const UserPage(),
    SettingsPage(),
    LoginView(),
  ];
  @override
  void initState() {
    super.initState();
    _getToken();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _getToken() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? token = await messaging.getToken();
      print(token);
      setState(() {
        _fcmToken = token ?? 'Failed to get token';
      });
    } catch (e) {
      print('Error fetching token: $e');
      setState(() {
        _fcmToken = 'Error fetching token: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        backgroundColor: MyColor.closeRedColor,
        unselectedItemColor: MyColor.gmailColor,
        selectedItemColor: MyColor.red,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: context.locale.translate('home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: context.locale.translate('user'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: context.locale.translate('setting'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.login),
            label: context.locale.translate('login'),
          ),
        ],
      ),
    );
  }
}
