import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:volunteer_verse/features/home/donation/donation_option.dart';
import 'package:volunteer_verse/features/home/home_page.dart';

class DonationDetailsScreen extends StatefulWidget {
  @override
  _DonationDetailsScreenState createState() => _DonationDetailsScreenState();
}

class _DonationDetailsScreenState extends State<DonationDetailsScreen> {
  double donationProgress = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/learn.jpg'),
            SizedBox(height: 16.0),
            Text(
              'Help someone who needs better place',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('150 Donated'),
                Spacer(),
                Text('3 Days left'),
              ],
            ),
            SizedBox(height: 8.0),
            LinearPercentIndicator(
              lineHeight: 14.0,
              percent: donationProgress,
              backgroundColor: Colors.grey[300],
              progressColor: Colors.green,
            ),
            SizedBox(height: 8.0),
            Text(
              'Target: Rs 100000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'John is in urgent need of assistance to complete his house, which will provide essential shelter for him and his family. With the construction nearly finished, they are just a few steps away from having a safe and secure home. However, they are facing financial constraints that are preventing them from buying the necessary materials and covering the remaining construction costs. Your generous donation can make a significant difference, ensuring that John and his family have a place to call their own. Every contribution, no matter how small, brings them closer to achieving this critical milestone. Thank you for your kindness and support in helping them build a stable and hopeful future.',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonationOption()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(97, 124, 181, 1),
                ),
                child: Text(
                  'Donate Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
