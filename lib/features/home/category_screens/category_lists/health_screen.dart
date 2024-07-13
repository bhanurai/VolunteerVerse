import 'package:flutter/material.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(97, 124, 181, 1),
        title: const Text('Health'),
      ),
      body: const Center(
        child: Text(
          'Details about Health',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
