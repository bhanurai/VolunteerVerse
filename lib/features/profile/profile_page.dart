import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/global/featured_organization/detail_page.dart';
import 'package:volunteer_verse/features/profile/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(97, 124, 181, 1),
        automaticallyImplyLeading: false,
        title: Text(
          'Profile Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/me.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'Ram Pandey',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_border, color: Color.fromRGBO(97, 124, 181, 1)),
                Icon(Icons.star_border, color: Color.fromRGBO(97, 124, 181, 1)),
                Icon(Icons.star_border, color: Color.fromRGBO(97, 124, 181, 1)),
                Icon(Icons.star_border, color: Color.fromRGBO(97, 124, 181, 1)),
                Icon(Icons.star_border, color: Color.fromRGBO(97, 124, 181, 1)),
                Text('', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8),
                      Text(
                        'Serving Date',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'NA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(height: 8),
                      Text(
                        'Hours',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'NA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8),
                      Text('Impact',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(
                        'NA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Organization',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BabylifeHomePage(
                          organizationName: '',
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/baby.jpg'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayasNepalApp(
                          organizationName: '',
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/prayas.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MaitiNepal(
                          organizationName: '',
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/maiti.jpg'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
