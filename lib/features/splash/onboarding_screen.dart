import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/auth/login_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              OnboardingPage(
                title: 'Welcome to VolunteerVerse',
                description:
                    'Our app combines eager people like you with meaningful community service. VolunteerVerse helps you find and join initiatives that match your interests and schedule, whether you have hours or days. Do good one act at once! Ready to start? Visit VolunteerVerse to locate your first volunteer opportunity!',
                imageAsset: 'assets/images/on1.jpg',
              ),
              OnboardingPage(
                title: 'Easy To Use',
                description:
                    'VolunteerVerse App emphasizes user engagement through a personalized volunteer experience. It offers user profiles, search and filter options, and a calendar, suggesting a user-centric design. Unique features like ratings and reviews, chat integration, and donation integration are particularly geared towards enhancing user engagement and fostering a community within the app.',
                imageAsset: 'assets/images/on2.jpg',
              ),
              OnboardingPage(
                title: 'Easy To Connect',
                description:
                    'The main goal of VolunteerVerse is to facilitate communication between those who are eager to help and those who are in need of assistance. Volunteers enjoy a personalized experience tailored to their availability, interests, and skill set. Whether they\'re passionate about environmental conservation, education, or social justice, VolunteerVerse empowers volunteers to find opportunities that align with their passions and make a meaningful impact.',
                imageAsset: 'assets/images/on3.jpg',
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Skip'),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentIndex < 2)
                  Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    if (_currentIndex < 2) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  child: Text(_currentIndex < 2 ? 'Next' : 'Get Started'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAsset, height: 200),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
