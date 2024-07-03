import 'package:flutter/material.dart';

class PrayasNepalApp extends StatelessWidget {
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
                      // Add back button functionality here
                    },
                  ),
                  SizedBox(width: 8.0),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                    child: Text('Prayas Nepal'),
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
                      Image.asset('assets/images/prayas.png'),
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
    );
  }
}

class BabylifeHomePage extends StatelessWidget {
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
                      // Add back button functionality here
                    },
                  ),
                  SizedBox(width: 8.0),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                    child: Text('Baby Life Home'),
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
                      Image.asset('assets/images/baby.jpg'),
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
    );
  }
}

class MaitiNepal extends StatelessWidget {
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
                      // Add back button functionality here
                    },
                  ),
                  SizedBox(width: 8.0),
                  DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                    child: Text('Maiti Nepal'),
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
                      Image.asset('assets/images/maiti.jpg'),
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
    );
  }
}
