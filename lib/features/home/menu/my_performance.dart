import 'package:flutter/material.dart';

class MyPerformancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Performance"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Progress",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: 0.7, // Example progress value
                backgroundColor: Colors.grey[200],
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              Text(
                "Worked Organizations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildOrganizationCard("Organization 1", "4.5", 120),
              _buildOrganizationCard("Organization 2", "4.8", 95),
              SizedBox(height: 20),
              Text(
                "Rating",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < 4 ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  );
                }),
              ),
              SizedBox(height: 20),
              Text(
                "Working Hours",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Total: 215 hours",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrganizationCard(String name, String rating, int hours) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text("Rating: $rating, Hours: $hours"),
      ),
    );
  }
}
