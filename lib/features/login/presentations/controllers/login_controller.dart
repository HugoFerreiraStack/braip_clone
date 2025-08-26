import 'package:braip_clone/config/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  void login() {
    Get.toNamed(Routes.home);
  }
  
}