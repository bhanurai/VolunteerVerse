import 'package:flutter/material.dart';

class ClothesScreen extends StatelessWidget {
  const ClothesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(97, 124, 181, 1),
        title: const Text('Clothes'),
      ),
      body: const Center(
        child: Text(
          'Details about Clothes',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
