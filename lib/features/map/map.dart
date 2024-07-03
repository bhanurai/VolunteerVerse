// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class MapScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Leaflet Maps in Flutter'),
//       ),
//       body: FlutterMap(
//         options: MapOptions(
//           center: LatLng(37.77483, -122.41942), // San Francisco
//           zoom: 13.0,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c'],
//             userAgentPackageName: 'com.example.app',
//           ),
//           MarkerLayer(
//             markers: [
//               Marker(
//                 point: LatLng(37.77483, -122.41942),
//                 builder: (ctx) => Icon(
//                   Icons.location_on,
//                   color: Colors.red,
//                   size: 40.0,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

