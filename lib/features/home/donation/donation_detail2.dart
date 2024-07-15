import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:volunteer_verse/features/home/donation/donation_option2.dart';
import 'package:volunteer_verse/features/home/home_page.dart';

class DonationDetailsScreen2 extends StatefulWidget {
  @override
  _DonationDetailsScreen2State createState() => _DonationDetailsScreen2State();
}

class _DonationDetailsScreen2State extends State<DonationDetailsScreen2> {
  double donationProgress = 0.4;

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
            Image.asset('assets/images/homeless.jpg'),
            SizedBox(height: 16.0),
            Text(
              'Support Homeless People Affected by Natural Disaster',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('80 Donated'),
                Spacer(),
                Text('5 Days left'),
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
              'Target: Rs 150000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Many families have been displaced due to the recent natural disaster. They have lost their homes, belongings, and are in urgent need of basic necessities. Your donations can provide them with temporary shelter, food, clothing, and medical assistance. Every contribution, big or small, helps in providing relief and rebuilding their lives. Thank you for your support and generosity in these difficult times.',
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
                    MaterialPageRoute(builder: (context) => DonationOption2()),
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
