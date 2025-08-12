import 'package:braip_clone/features/splash/presentations/bindings/splash_binding.dart';
import 'package:braip_clone/features/splash/presentations/pages/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.splash;

  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
 
  ];
}