import 'package:flutter/material.dart';

class EnvironmentScreen extends StatelessWidget {
  const EnvironmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(97, 124, 181, 1),
        title: const Text('Environment'),
      ),
      body: const Center(
        child: Text(
          'Details about Environment',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
