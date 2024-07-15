import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/map/map.dart';

class BagmatiCleanupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bagmati River Cleanup',
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
        title: Text('Bagmati River Cleanup'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Image.asset(
            'assets/images/bagmati.jpg',
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          Text(
            'Bagmati River Cleanup',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('organized by Kabita Maya'),
          SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Icon(Icons.group),
              SizedBox(width: 8.0),
              Text('+29 volunteers'),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.location_on),
              SizedBox(width: 8.0),
              Text('Bagmati, Kathmandu'),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.access_time),
              SizedBox(width: 8.0),
              Text('July 24, 07:00 AM-11PM'),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'The Bagmati River Cleanup campaign is a significant environmental initiative aimed at restoring and maintaining the ecological health of the Bagmati River in Nepal. This river holds substantial cultural, religious, and environmental importance, particularly in Kathmandu Valley, where it has suffered from severe pollution due to urbanization, industrial discharge, and waste mismanagement.',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 16.0),
          Container(
            height: 200,
            child: MapScreen(), 
          ),
        ],
      ),
    );
  }
}
