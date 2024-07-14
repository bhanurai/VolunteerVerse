import 'package:volunteer_verse/features/auth/login_page.dart';
import 'package:volunteer_verse/features/auth/register_page.dart';
import 'package:volunteer_verse/features/home/home_page.dart';
import 'package:volunteer_verse/features/splash/loading_page.dart';
import 'package:volunteer_verse/features/splash/onboarding_screen.dart';

class AppRoute {
  AppRoute._();
  static const String dashboardRoute = '/das';
  static const String loadingScreenRoute= '/spl';
  static const String onboardingScreenRoute= '/obd';
  static const String registerScreenRoute= '/res';
  static const String loginPageRoute= '/log';
  

  static getApplicationRoute() {
    return {
      dashboardRoute: (context) => HomePage(),
      loadingScreenRoute: (context) => const SplashScreen(),
      onboardingScreenRoute: (context) =>  OnboardingScreen(),
      registerScreenRoute: (context) =>  RegistrationScreen(),
      loginPageRoute: (context) =>  LoginPage(),

    };
  }
}
