import 'package:braip_clone/config/themes/app_assets.dart';
import 'package:braip_clone/config/themes/app_colors.dart';
import 'package:braip_clone/features/splash/presentations/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(
          AppAssets.logo,
          width: 180,
        ),
      ),
    );
  }
}