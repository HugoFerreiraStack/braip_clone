import 'package:braip_clone/config/themes/app_assets.dart';
import 'package:braip_clone/config/themes/app_colors.dart';
import 'package:braip_clone/features/login/presentations/controllers/login_controller.dart';
import 'package:braip_clone/shared/widgets/buttons/custom_button.dart';
import 'package:braip_clone/shared/widgets/buttons/filled_button.dart';
import 'package:braip_clone/shared/widgets/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6D36FB),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.logo, width: 200),
                  const SizedBox(height: 48),
                  CustomTextField(
                    hintText: 'Digite seu e-mail',
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Digite sua senha',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    suffixIcon: Icons.visibility,
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    onPressed: () {},
                    backgroundColor: AppColors.secondary,
                    child: const Text(
                      'Informe suas credenciais',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomFilledButton(onPressed: () {}),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Registre-se',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
