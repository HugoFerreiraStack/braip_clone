import 'package:braip_clone/config/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offAllNamed(Routes.login);
    });
  }
}
