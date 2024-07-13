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
    return Scaffold(
      body: Container(
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
                        Text(
                          'Prayatnashil Community Development Society (PRAYAS-Nepal) is a non-governmental organization dedicated towards quality education, livelihood, prosperous health, good-governance, inclusive and well-being of poor and marginalized Nepalese people. Prayas or PRAYAS-Nepal focuses on children, women, marginalized and rural communities people by setting holistic development goals in creating transformed and interdependent society.\n\n'
                          'PRAYAS-Nepal envisions a new Nepal by positive transformation of socio-economic aspect of society and individual through capacity enhancement and optimum utilization of local resources. From its inception, it works for Nepalese children for quality education to produce quality lives and families for safe environment with their dignity, respect, food security, income generating, health or security regardless of their gender, ethnicity and religion.\n\n'
                          'PRAYAS-Nepal is registered with District Administration Office of Dhading (on 2058-12-8(B.S.)) as well as Social Welfare Council (2059-9-6) since it has been working in the field of community development. It is also a member of NFN (NGO Federation Nepal). The daily activity is managed by. PRAYAS Nepal has an office located at Neelkantha 8 Dhading Besi and co-ordination and logistic support is managed at Kathmandu. The organization was founded with 9 members and now it has 31 active members.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
    return Scaffold(
      body: Container(
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
                        Text(
                          'Prayatnashil Community Development Society (PRAYAS-Nepal) is a non-governmental organization dedicated towards quality education, livelihood, prosperous health, good-governance, inclusive and well-being of poor and marginalized Nepalese people. Prayas or PRAYAS-Nepal focuses on children, women, marginalized and rural communities people by setting holistic development goals in creating transformed and interdependent society.\n\n'
                          'PRAYAS-Nepal envisions a new Nepal by positive transformation of socio-economic aspect of society and individual through capacity enhancement and optimum utilization of local resources. From its inception, it works for Nepalese children for quality education to produce quality lives and families for safe environment with their dignity, respect, food security, income generating, health or security regardless of their gender, ethnicity and religion.\n\n'
                          'PRAYAS-Nepal is registered with District Administration Office of Dhading (on 2058-12-8(B.S.)) as well as Social Welfare Council (2059-9-6) since it has been working in the field of community development. It is also a member of NFN (NGO Federation Nepal). The daily activity is managed by. PRAYAS Nepal has an office located at Neelkantha 8 Dhading Besi and co-ordination and logistic support is managed at Kathmandu. The organization was founded with 9 members and now it has 31 active members.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
    return Scaffold(
      body: Container(
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
                        Text(
                          'Prayatnashil Community Development Society (PRAYAS-Nepal) is a non-governmental organization dedicated towards quality education, livelihood, prosperous health, good-governance, inclusive and well-being of poor and marginalized Nepalese people. Prayas or PRAYAS-Nepal focuses on children, women, marginalized and rural communities people by setting holistic development goals in creating transformed and interdependent society.\n\n'
                          'PRAYAS-Nepal envisions a new Nepal by positive transformation of socio-economic aspect of society and individual through capacity enhancement and optimum utilization of local resources. From its inception, it works for Nepalese children for quality education to produce quality lives and families for safe environment with their dignity, respect, food security, income generating, health or security regardless of their gender, ethnicity and religion.\n\n'
                          'PRAYAS-Nepal is registered with District Administration Office of Dhading (on 2058-12-8(B.S.)) as well as Social Welfare Council (2059-9-6) since it has been working in the field of community development. It is also a member of NFN (NGO Federation Nepal). The daily activity is managed by. PRAYAS Nepal has an office located at Neelkantha 8 Dhading Besi and co-ordination and logistic support is managed at Kathmandu. The organization was founded with 9 members and now it has 31 active members.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
