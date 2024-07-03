import 'package:flutter/material.dart';

class PrayasNepalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayas Nepal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
            'PRAYAS-Nepal envisions a new Nepal by positive transformation of socio-economic aspect of society and individual through capacity enhancement and optimum utilization of local resources.'),
      ),
    );
  }
}

class BabylifeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Babylife Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
            'Baby Life Home is an organization dedicated to providing care for orphaned and abandoned children in Nepal.'),
      ),
    );
  }
}


