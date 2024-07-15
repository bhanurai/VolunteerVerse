import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/global/discover_opportunities/event1.dart';
import 'package:volunteer_verse/features/global/discover_opportunities/event_page.dart';
import 'package:volunteer_verse/features/global/featured_organization/detail_page.dart';
import 'package:volunteer_verse/features/home/search/search_page.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  final List<String> organizations = [
    'Prayas Nepal',
    'Baby Life Home',
    'Maiti Nepal'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              minHeight: 56.0,
              maxHeight: 56.0,
              child: Container(
                color: const Color.fromRGBO(97, 124, 181, 1),
              ),
            ),
            pinned: true,
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromRGBO(97, 124, 181, 1),
            expandedHeight: 130.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 70.0, 16.0, 16.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: SizedBox(
                    width: 350,
                    height: 60,
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(
                              organizations: organizations,
                            ),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Organizations...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Organizations',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
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
                          child: OrganizationCard(
                            imagePath: 'assets/images/prayas.png',
                            title: 'Prayas Nepal',
                            description:
                                'PRAYAS-Nepal envisions a new Nepal by positive transformation of socio-economic aspect of society and individual through capacity enhancement and optimum utilization of local resources.',
                          ),
                        ),
                        SizedBox(width: 8.0),
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
                          child: OrganizationCard(
                            imagePath: 'assets/images/baby.jpg',
                            title: 'Babylife Home',
                            description:
                                'Baby Life Home is an organization dedicated to providing care for orphaned and abandoned children in Nepal.',
                          ),
                        ),
                        SizedBox(width: 8.0),
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
                          child: OrganizationCard(
                            imagePath: 'assets/images/maiti.jpg',
                            title: 'Maiti Nepal',
                            description:
                                'Maiti Nepal was born out of a crusade to protect Nepali girls and women from crimes like domestic violence, trafficking for flesh trade, child prostitution, child labor and various forms of abuse, exploitation and torture.',
                          ),
                        ),
                      ],
                    ),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BagmatiCleanupApp(),
                              ),
                            );
                          },
                          child: OpportunityCard(
                            imagePath: 'assets/images/bagmati.jpg',
                            description:
                                'Team up with a group and help pick up trash at Bagmati river.',
                            eventDate: 'Event on Thus July 24',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TudhikhelCleanupApp(),
                              ),
                            );
                          },
                          child: OpportunityCard(
                            imagePath: 'assets/images/tudikhel.png',
                            description: 'Team up with a group and ...',
                            eventDate: 'Event on Wed July 28',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrganizationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  OrganizationCard(
      {required this.imagePath,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    String displayDescription = description;
    bool isTruncated = description.length > 100;

    if (isTruncated) {
      displayDescription = description.substring(0, 97) + '...';
    }

    return Container(
      width: 200,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 30.0,
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              RichText(
                text: TextSpan(
                  text: displayDescription,
                  style: TextStyle(color: Colors.black38),
                  children: isTruncated
                      ? [
                          TextSpan(
                            text: ' read more',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ]
                      : [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OpportunityCard extends StatelessWidget {
  final String imagePath;
  final String description;
  final String eventDate;

  OpportunityCard(
      {required this.imagePath,
      required this.description,
      required this.eventDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Adjust the width as per your requirement
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(description),
                      SizedBox(height: 8.0),
                      Text(eventDate, style: TextStyle(color: Colors.blueGrey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
