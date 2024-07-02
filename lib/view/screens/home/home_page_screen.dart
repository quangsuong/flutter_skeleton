import 'package:flutter/material.dart';
import 'package:flutter_skeleton/view/screens/detail/detail_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailScreen(),
              ),
            );
          },
          child: const Text('Go to Second Page'),
        ),
      ),
    );
  }
}
