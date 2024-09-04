import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
          child: Column(children: [
        Text('Id : $id'),
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Go to Home Page '),
        ),
      ])),
    );
  }
}
