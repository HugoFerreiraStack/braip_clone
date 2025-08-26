import 'package:get/get.dart';
import '../pages/cadastro_page.dart';

class CadastroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CadastroPage>(() => const CadastroPage());
  }
}
