
  import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(97, 124, 181, 1),
        title: const Text('Education'),
      ),
      body: const Center(
        child: Text(
          'Details about Education',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
