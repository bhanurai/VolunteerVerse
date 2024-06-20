import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(97, 124, 181, 1),
          flexibleSpace: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hello, Ram',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                '"Serve . Connect . Impact"',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom: 16.0), // Aligns with bottom of AppBar
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Organizations...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryButton(icon: Icons.house, label: 'Shelter'),
                  CategoryButton(icon: Icons.book, label: 'Education'),
                  CategoryButton(icon: Icons.local_offer, label: 'Clothes'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Donation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: DonationCard(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Global',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  final IconData icon;
  final String label;

  const CategoryButton({super.key, required this.icon, required this.label});

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(widget.icon),
          onPressed: () {},
        ),
        Text(widget.label),
      ],
    );
  }
}

class DonationCard extends StatefulWidget {
  const DonationCard({super.key});

  @override
  _DonationCardState createState() => _DonationCardState();
}

class _DonationCardState extends State<DonationCard> {
  double donationProgress = 0.5; // Example progress value

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://via.placeholder.com/150',
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Help someone to build their dream',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('By Hari Thapa'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: donationProgress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text('Target: Rs 100000'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text('${(donationProgress * 100).toStringAsFixed(0)}%'),
          ),
        ],
      ),
    );
  }
}
