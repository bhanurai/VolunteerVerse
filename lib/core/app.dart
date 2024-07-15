import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:volunteer_verse/config/routes/app_routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String khaltiPublicKey =
      "test_public_key_101654dbf6c14f8eabe631ea390264dd";

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: khaltiPublicKey,
      enabledDebugging: true,
      builder: (context, navKey) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'VolunteerVerse',
          initialRoute: AppRoute.loadingScreenRoute,
          routes: AppRoute.getApplicationRoute(),
          navigatorKey: navKey,
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
        );
      },
    );
  }
}
