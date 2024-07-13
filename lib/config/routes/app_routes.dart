import 'package:volunteer_verse/features/home/home_page.dart';
import 'package:volunteer_verse/features/splash/loading_page.dart';
import 'package:volunteer_verse/features/splash/onboarding_screen.dart';

class AppRoute {
  AppRoute._();
  static const String dashboardRoute = '/das';
  static const String loadingScreenRoute= '/spl';
  static const String onboardingScreenRoute= '/obd';
  

  static getApplicationRoute() {
    return {
      dashboardRoute: (context) => HomePage(),
      loadingScreenRoute: (context) => const SplashScreen(),
      onboardingScreenRoute: (context) =>  OnboardingScreen(),

    };
  }
}
