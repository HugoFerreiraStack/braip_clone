import 'package:get/get.dart';

enum HomePageType {
  dashboard,
  loja,
  produtos,
  streaming,
  afiliacoes,
  responsaveis,
  ferramentas,
  relatorios,
  configuracoes,
}

class HomeController extends GetxController {
  final Rx<HomePageType> currentPage = HomePageType.dashboard.obs;

  void changePage(HomePageType pageType) {
    currentPage.value = pageType;
  }

  String getPageTitle() {
    switch (currentPage.value) {
      case HomePageType.dashboard:
        return 'Dashboard';
      case HomePageType.loja:
        return 'Loja';
      case HomePageType.produtos:
        return 'Produtos';
      case HomePageType.streaming:
        return 'Streaming';
      case HomePageType.afiliacoes:
        return 'Afiliações';
      case HomePageType.responsaveis:
        return 'Responsáveis';
      case HomePageType.ferramentas:
        return 'Ferramentas';
      case HomePageType.relatorios:
        return 'Relatórios';
      case HomePageType.configuracoes:
        return 'Configurações';
    }
  }
}