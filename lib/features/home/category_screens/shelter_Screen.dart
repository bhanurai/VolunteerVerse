import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/home/donation/donation_card.dart';

class ShelterScreen extends StatelessWidget {
  const ShelterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(97, 124, 181, 1),
        title: const Text('Shelter'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DonationCard()),
            );
          },
          child: const Text(
            'Go to Details',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
