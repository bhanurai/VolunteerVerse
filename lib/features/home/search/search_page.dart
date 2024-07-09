import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/global/featured_organization/detail_page.dart';

class SearchPage extends StatefulWidget {
  final List<String> organizations;

  SearchPage({required this.organizations});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> filteredOrganizations = [];

  @override
  void initState() {
    super.initState();
    filteredOrganizations = widget.organizations;
    _searchController.addListener(_filterOrganizations);
  }

  void _filterOrganizations() {
    setState(() {
      filteredOrganizations = widget.organizations
          .where((org) =>
              org.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterOrganizations);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search Organizations...',
            border: InputBorder.none,
          ),
          autofocus: true,
        ),
      ),
      body: ListView.builder(
        itemCount: filteredOrganizations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredOrganizations[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrganizationDetailPage(
                    organizationName: filteredOrganizations[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class OrganizationDetailPage extends StatelessWidget {
  final String organizationName;

  const OrganizationDetailPage({Key? key, required this.organizationName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget organizationDetail;

    switch (organizationName) {
      case 'Prayas Nepal':
        organizationDetail = PrayasNepalApp(organizationName: organizationName);
        break;
      case 'Baby Life Home':
        organizationDetail = BabylifeHomePage(organizationName: organizationName);
        break;
      case 'Maiti Nepal':
        organizationDetail = MaitiNepal(organizationName: organizationName);
        break;
      default:
        organizationDetail = Center(child: Text('Organization not found.'));
    }

    return Scaffold(
      body: organizationDetail,
    );
  }
}
