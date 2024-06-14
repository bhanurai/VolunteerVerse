import 'package:volunteer_verse/features/splash/loading_page.dart';

class AppRoute {
  AppRoute._();
  static const String dashboardRoute = '/das';
  static const String loadingScreenRoute= '/spl';
  

  static getApplicationRoute() {
    return {
      loadingScreenRoute: (context) => const SplashScreen(),

      
    };
  }
}
