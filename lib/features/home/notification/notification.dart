import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Bagmati Cleaning Event',
      'subtitle':
          'Event is going to happen at July 18th so don\'t miss it out.',
      'date': 'July 24, 2024',
      'icon': 'assets/images/logo.png',
    },
    {
      'title': 'Tudhikhel Cleanup',
      'subtitle':
          'Event is going to happen at July 24th so don\'t miss it out.',
      'date': 'July 28, 2024',
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
