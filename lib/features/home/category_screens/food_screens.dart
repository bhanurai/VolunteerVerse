import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(97, 124, 181, 1),
        title: const Text('Food'),
      ),
      body: const Center(
        child: Text(
          'Details about Food',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
