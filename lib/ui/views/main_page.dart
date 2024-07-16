import 'package:flutter/material.dart';
import 'package:flutter_skeleton/generated/l10n.dart';
import 'package:flutter_skeleton/ui/views/login/login_view.dart';
import 'package:flutter_skeleton/ui/views/settings/settings_page.dart';

import 'home/home_page_screen.dart';
import 'user/user_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    const UserPage(),
    SettingsPage(),
    LoginView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: S.of(context).user,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: S.of(context).setting,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.login),
            label: S.of(context).login,
          ),
        ],
      ),
    );
  }
}
