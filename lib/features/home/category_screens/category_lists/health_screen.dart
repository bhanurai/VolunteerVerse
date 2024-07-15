import 'package:flutter/material.dart';

class HealthScreen extends StatelessWidget {
  HealthScreen({super.key});
  final List<String> organizations = [
    'Prayas Nepal',
    'Baby Life Home',
    'Maiti Nepal',
  ];

  void navigateToDetailPage(BuildContext context, String organizationName) {
    switch (organizationName) {
      case 'Prayas Nepal':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PrayasNepalApp(organizationName: organizationName),
          ),
        );
        break;
      case 'Baby Life Home':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BabylifeHomePage(organizationName: organizationName),
          ),
        );
        break;
      case 'Maiti Nepal':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MaitiNepal(organizationName: organizationName),
          ),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(97, 124, 181, 1),
        title: const Text('Health Care'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: organizations.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(Icons.volunteer_activism,
                    color: Color.fromRGBO(97, 124, 181, 1), size: 40),
                title: Text(
                  organizations[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward,
                    color: Color.fromRGBO(97, 124, 181, 1)),
                onTap: () {
                  navigateToDetailPage(context, organizations[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class PrayasNepalApp extends StatelessWidget {
  final String? organizationName;

  const PrayasNepalApp({Key? key, required this.organizationName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 8.0),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                    child: Text(organizationName!),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: DefaultTextStyle(
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/prayas.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Prayatnashil Community Development Society (PRAYAS-Nepal) is a non-governmental organization dedicated towards quality education, livelihood, prosperous health, good-governance, inclusive and well-being of poor and marginalized Nepalese people. Prayas or PRAYAS-Nepal focuses on children, women, marginalized and rural communities people by setting holistic development goals in creating transformed and interdependent society.',
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'PRAYAS-Nepal envisions a new Nepal by positive transformation of socio-economic aspect of society and individual through capacity enhancement and optimum utilization of local resources. From its inception, it works for Nepalese children for quality education to produce quality lives and families for safe environment with their dignity, respect, food security, income generating, health or security regardless of their gender, ethnicity and religion.',
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'PRAYAS-Nepal is registered with District Administration Office at Dhading (on 2058-12-6B.S.) as well as Social welfare Council (2059-9-6). Since then it has been working in the field of community development. It is also a member of NGO federation Nepal. The daily activity is managed by. PRAYAS Nepal has an office located at Neelakantha 5 Dhading Bensi and co-ordination and logistic support unit is being established at Kathamandu. The organization was founded with 9 members and now it has 31 active members. The organization has 7-member executive committee. It has 17 permanent staff members and other project staff.',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BabylifeHomePage extends StatelessWidget {
  final String? organizationName;

  const BabylifeHomePage({Key? key, required this.organizationName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 8.0),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                    child: Text(organizationName!),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: DefaultTextStyle(
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/baby.jpg',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mr. Rajkumar Pun and Mrs. Uma Gurung led to the establishment of Baby Life Home in the year 2067 B.S. (2009 A.D).',
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Baby life home is primarily focused on the rescuing of children from districts of: Dang, Baitadi, Kailali, Salyan, Dailekh, Surkhet, Rolpa and Kanchanpur where these children were obliged to live tedious and miserable lives in helpless situations under persistent social disintegration and discrimination.',
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'After their rescue, the children of Baby Life Home/Saphalta HIV Shikshya Sadan now feel more confident, capable and inspired. They are also much, much healthier and almost all appear no different than any other child (except the deep understandings, emotions and even wisdom and compassion one can see and feel when looking into their eyes).',
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Baby life Home excels at giving loving parentage to neglected children after the demise of their parents and rejection of their families and society. Our organization has been active in rescue-programs for the basic needs, formal education, and healthcare of these remarkable children.',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaitiNepal extends StatelessWidget {
  final String? organizationName;

  const MaitiNepal({Key? key, required this.organizationName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 8.0),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                    child: Text(organizationName!),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: DefaultTextStyle(
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/maiti.jpg',
                          width: 200,
                          height: 150,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maiti is a beautiful word from the Nepali language, meaning a woman’s childhood home. Apart from being a beautiful word that evokes memories and a feeling of comfort, Maiti is a concept that many Nepali women carry close to their hearts.',
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Founded in 1993, Maiti Nepal carries the same concept and space for women that they bear close to their heart for the word ‘Maiti.’ Maiti Nepal is the place where women who have been trafficked, exploited, abused, or had their rights denied in any form can find a home for themselves. Headquartered in Kathmandu, Maiti Nepal is a non-profit, secular organization working to protect and improve the lives of vulnerable individuals and rescue survivors. The organization promotes children’s and women’s rights and aims to put an end to trafficking through these key activity sectors: 2A’s advocacy and awareness, 6P’s prevention, protection, participation, prosecution, partnership and policy, 5R’s rescue, repatriation, rehabilitation, reintegration and referral. It seeks to build awareness and secure cooperation from schools and college students, parliamentarians, federal, provincial, and local governments, law enforcement agencies and organizations in Nepal, and their counterparts in India.',
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Maiti Nepal, today, conducts a wide range of activities. Organizing awareness campaigns, community sensitization programs, rescue operations, apprehending traffickers, providing legal support to the needy, women empowerment programs, training, providing antiretroviral therapy (ART) to children and women infected by HIV are regular activities of the organization.',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
