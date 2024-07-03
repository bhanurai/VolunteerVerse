import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/home/category_screens/clothes_screen.dart';
import 'package:volunteer_verse/features/home/category_screens/education_screen.dart';
import 'package:volunteer_verse/features/home/category_screens/environment_screen.dart';
import 'package:volunteer_verse/features/home/category_screens/food_screens.dart';
import 'package:volunteer_verse/features/home/category_screens/health_screen.dart';
import 'package:volunteer_verse/features/home/category_screens/shelter_Screen.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  List<String> categories = [
    "Shelter",
    "Education",
    "Clothes",
    "Health",
    "Food",
    "Environment",
  ];

  List<String> imagePaths = [
    'assets/images/shelter.png',
    'assets/images/education.png',
    'assets/images/clothes.png',
    'assets/images/health.png',
    'assets/images/food.png',
    'assets/images/environment.png',
  ];

  void _onCategoryTap(String category) {
    if (category == "Shelter") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ShelterScreen(),
        ),
      );
    } else if (category == "Education") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EducationScreen(),
        ),
      );
    } else if (category == "Clothes") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ClothesScreen(),
        ),
      );
    } else if (category == "Health") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HealthScreen(),
        ),
      );
    } else if (category == "Food") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FoodScreen(),
        ),
      );
    } else if (category == "Environment") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EnvironmentScreen(),
        ),
      );
    } else {
      print("Tapped on $category");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Category',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _onCategoryTap(categories[index]),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color.fromARGB(255, 175, 172, 172),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(31, 160, 158, 158)
                            .withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(imagePaths[index], width: 40, height: 40),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
