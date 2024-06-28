import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
// import 'package:khalti_flutter/localization/khalti_localizations.dart';
import 'package:volunteer_verse/config/routes/app_routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Khalti Public Key, replace with your own key for production
  final String khaltiPublicKey = "test_public_key_d5d9f63743584dc38753056b0cc737d5";

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
