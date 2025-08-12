import 'package:braip_clone/config/routes/app_pages.dart';
import 'package:braip_clone/features/splash/presentations/bindings/splash_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      initialBinding: SplashBinding(),
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
  }
}
