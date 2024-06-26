import 'package:flutter/material.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(97, 124, 181, 1),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
        title: Text('Global Page'),
        actions: [
          IconButton(
                      icon:
                          const Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {},
                    ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Featured Organizations',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              OrganizationCard(
                logo: Icons.business,
                title: 'Prayas Nepal',
                description: 'PRAYAS-Nepal envisions a new Nepal by positive transformation of socio-economic aspect of society and individual through capacity enhancement and optimum utilization of local resources.',
              ),
              OrganizationCard(
                logo: Icons.home,
                title: 'Babylife Home',
                description: 'Baby Life Home is an ...',
              ),
              SizedBox(height: 16.0),
              Text(
                'Discover Opportunities',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              OpportunityCard(
                imageUrl: 'https://via.placeholder.com/150',
                description: 'Team up with a group and help pick up trash at Bagmati river.',
                eventDate: 'Event on Wed May 28',
              ),
              OpportunityCard(
                imageUrl: 'https://via.placeholder.com/150',
                description: 'Team up with a group and ...',
                eventDate: 'Event on Wed May 28',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrganizationCard extends StatelessWidget {
  final IconData logo;
  final String title;
  final String description;

  OrganizationCard({required this.logo, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(logo),
              radius: 30.0,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OpportunityCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String eventDate;

  OpportunityCard({required this.imageUrl, required this.description, required this.eventDate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description),
                SizedBox(height: 8.0),
                Text(eventDate, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
