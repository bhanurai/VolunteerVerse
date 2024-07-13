import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformancePage extends StatefulWidget {
  @override
  _PerformancePageState createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  List<OrganizationData> organizations = [];

  int totalWorkingHours = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotalHours();
  }

  void _calculateTotalHours() {
    int totalHours = 0;
    for (var org in organizations) {
      totalHours += org.hoursWorked;
    }
    setState(() {
      totalWorkingHours = totalHours;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Performance'),
        backgroundColor: Color.fromRGBO(97, 124, 181, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance Chart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 0),
                        FlSpot(0, 0),
                        FlSpot(0, 0),
                        FlSpot(0, 0),
                        FlSpot(0, 0),
                      ],
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Worked Organizations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: organizations.isNotEmpty
                  ? ListView.builder(
                      itemCount: organizations.length,
                      itemBuilder: (context, index) {
                        return _buildOrganizationCard(organizations[index]);
                      },
                    )
                  : Center(
                      child: Text(
                        'N/A',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Working Hours: $totalWorkingHours',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrganizationCard(OrganizationData organization) {
    return Card(
      child: ListTile(
        leading: Image.asset(organization.imagePath),
        title: Text(organization.name),
        subtitle: Text('Volunteer Hours: ${organization.hoursWorked}'),
      ),
    );
  }
}

class OrganizationData {
  final String name;
  final String imagePath;
  final int hoursWorked;

  OrganizationData({
    required this.name,
    required this.imagePath,
    required this.hoursWorked,
  });
}
