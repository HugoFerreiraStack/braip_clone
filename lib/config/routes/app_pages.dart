import 'package:braip_clone/features/home/presentations/bindings/home_binding.dart';
import 'package:braip_clone/features/home/presentations/pages/home_page.dart';
import 'package:braip_clone/features/home/presentations/pages/loja_page.dart';
import 'package:braip_clone/features/login/presentations/bindings/login_binding.dart';
import 'package:braip_clone/features/login/presentations/pages/login_page.dart';
import 'package:braip_clone/features/splash/presentations/bindings/splash_binding.dart';
import 'package:braip_clone/features/splash/presentations/pages/splash_page.dart';
import 'package:braip_clone/features/cadastro/presentations/bindings/cadastro_binding.dart';
import 'package:braip_clone/features/cadastro/presentations/pages/cadastro_page.dart';
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
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.loja,
      page: () => const LojaPage(),
    ),
    GetPage(
      name: Routes.cadastro,
      page: () => const CadastroPage(),
      binding: CadastroBinding(),
    ),
  ];
}