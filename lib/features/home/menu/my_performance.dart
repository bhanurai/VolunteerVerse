import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Performance'),
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
                        FlSpot(0, 3),
                        FlSpot(1, 1),
                        FlSpot(2, 4),
                        FlSpot(3, 2),
                        FlSpot(4, 5),
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
              child: ListView(
                children: [
                  _buildOrganizationCard(
                      'Organization 1', 'assets/images/logo.png'),
                  _buildOrganizationCard(
                      'Organization 2', 'assets/images/logo.png'),
                  _buildOrganizationCard(
                      'Organization 3', 'assets/images/logo.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrganizationCard(String name, String imagePath) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath),
        title: Text(name),
        subtitle: Text('Volunteer Hours: 50'),
      ),
    );
  }
}
