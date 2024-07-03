import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/home/donation/donation_detail.dart';

class DonationCard extends StatefulWidget {
  const DonationCard({super.key});

  @override
  _DonationCardState createState() => _DonationCardState();
}

class _DonationCardState extends State<DonationCard> {
  double donationProgress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DonationDetailsScreen()),
              );
            },
            child: Image.asset(
              'assets/images/learn.jpg',
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Help them to learn in better environment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('By Hari Thapa'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: donationProgress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text('Target: Rs 100000'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text('${(donationProgress * 100).toStringAsFixed(0)}%'),
          ),
        ],
      ),
    );
  }
}

class DonationDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/learn.jpg',
                width: double.infinity, height: 180, fit: BoxFit.cover),
            SizedBox(height: 16.0),
            Text(
              'Help someone who needs a better place',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'John is in urgent need of assistance to complete his house, which will provide essential shelter for him and his family. With the construction nearly finished, they are just a few steps away from having a safe and secure home. However, they are facing financial constraints that are preventing them from buying the necessary materials and covering the remaining construction costs. Your generous donation can make a significant difference, ensuring that John and his family have a place to call their own. Every contribution, no matter how small, brings them closer to achieving this critical milestone. Thank you for your kindness and support in helping them build a stable and hopeful future.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
