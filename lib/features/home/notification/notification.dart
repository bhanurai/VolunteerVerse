import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Donation Successful!',
      'subtitle': 'You have made a blood donation campaign.',
      'date': 'Today',
      'icon': 'assets/images/logo.png',
    },
    {
      'title': 'Bagmati Cleaning Event',
      'subtitle': 'Event is going to happen at June 1st so don\'t miss it out.',
      'date': 'Today',
      'icon': 'assets/images/logo.png',
    },
    {
      'title': 'Vacancy available!!',
      'subtitle': 'New the DKR education is available for volunteers.',
      'date': 'Yesterday',
      'icon': 'assets/images/logo.png',
    },
    {
      'title': 'Your profile has been updated',
      'subtitle': 'Now you can view your new profile.',
      'date': 'Yesterday',
      'icon': 'assets/images/logo.png',
    },
    {
      'title': 'Account Setup Successful!',
      'subtitle': 'Your account has been created!',
      'date': 'May 21,2024',
      'icon': 'assets/images/logo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: _buildNotificationList(),
      ),
    );
  }

  List<Widget> _buildNotificationList() {
    List<Widget> notificationList = [];
    String? currentDate;

    for (var notification in notifications) {
      if (notification['date'] != currentDate) {
        currentDate = notification['date'];
        notificationList.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            currentDate!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ));
      }
      notificationList.add(_buildNotificationItem(notification));
    }

    return notificationList;
  }

  Widget _buildNotificationItem(Map<String, String> notification) {
    return ListTile(
      leading: Image.asset(notification['icon']!),
      title: Text(notification['title']!),
      subtitle: Text(notification['subtitle']!),
    );
  }
}
