import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/home/home_page.dart';
import 'package:volunteer_verse/features/map/map2.dart';

class TudhikhelCleanupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tudhikhel Cleanup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CleanupPage(),
    );
  }
}

class CleanupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tudhikhel Cleanup'),
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Image.asset(
            'assets/images/tudikhel.png',
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          Text(
            'Tudhikhel Cleanup',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('organized by Ravi Yadav'),
          SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Icon(Icons.group),
              SizedBox(width: 8.0),
              Text('+12 volunteers'),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.location_on),
              SizedBox(width: 8.0),
              Text('Sundhara, Kathmandu'),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.access_time),
              SizedBox(width: 8.0),
              Text('July 28, 06:00 AM-10AM'),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'The Tudhikhel Area Cleanup initiative is a notable environmental and community-driven project focused on revitalizing and maintaining the Tudhikhel area, a significant open space in the heart of Kathmandu, Nepal. Tudhikhel is historically and culturally important, serving as a public park, parade ground, and venue for various events. However, due to urbanization and neglect, it has faced issues related to pollution, waste accumulation, and degradation.',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 16.0),
          Container(
            height: 200,
            child: MapScreen2(),
          ),
        ],
      ),
    );
  }
}
