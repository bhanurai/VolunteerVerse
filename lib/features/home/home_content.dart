import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/home/donation_card.dart';
import 'category_section.dart'; // Import the new category section

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: _SliverAppBarDelegate(
            minHeight: 56.0,
            maxHeight: 56.0,
            child: Container(
              color: const Color.fromRGBO(97, 124, 181, 1),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 35.0, left: 3.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          pinned: true,
        ),
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(97, 124, 181, 1),
          expandedHeight: 260.0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.all(18.0),
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
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '"Serve.Connect.Impact"',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
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
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategorySection(), // Use the new CategorySection widget here
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Donation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: DonationCard(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
