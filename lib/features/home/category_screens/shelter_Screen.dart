import 'package:flutter/material.dart';

class ShelterScreen extends StatelessWidget {
  const ShelterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(97, 124, 181, 1),
        title: const Text('Shelter'),
      ),
      body: const Center(
        child: Text(
          'Details about Shelter',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
