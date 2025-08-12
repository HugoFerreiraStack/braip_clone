import 'package:braip_clone/features/splash/presentations/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding  implements Bindings{
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}