import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/home/category_screens/category_lists/child_care_screen.dart';
import 'package:volunteer_verse/features/home/category_screens/category_lists/development_screen.dart';
import 'package:volunteer_verse/features/home/category_screens/category_lists/health_screen.dart';
import 'package:volunteer_verse/features/home/category_screens/category_lists/women_empowerment_screen.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  List<String> categories = [
    "Women Empowerment",
    "Health",
    "Child Care",
    "Development",
  ];

  List<String> imagePaths = [
    'assets/images/women.png',
    'assets/images/health.png',
    'assets/images/child.png',
    'assets/images/develop.png',
  ];

  void _onCategoryTap(String category) {
    switch (category) {
      case "Development":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DevelopmentScreen(),
          ),
        );
        break;
      case "Women Empowerment":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WomenEmpowerment(),
          ),
        );
        break;
      case "Child Care":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChildCareScreen(),
          ),
        );
        break;
      case "Health":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HealthScreen(),
          ),
        );
        break;
      default:
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
