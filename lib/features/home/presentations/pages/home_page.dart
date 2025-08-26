import 'package:braip_clone/features/home/widgets/drawer_menu.dart';
import 'package:braip_clone/features/home/widgets/custom_appbar.dart';
import 'package:braip_clone/features/home/widgets/product_list_item.dart';
import 'package:braip_clone/features/home/presentations/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    
    return Scaffold(
      appBar: const CustomAppbar(),
      drawer: DrawerMenu(controller: controller),
      body: Obx(() => _buildPageContent(controller.currentPage.value)),
    );
  }

  Widget _buildPageContent(HomePageType pageType) {
    switch (pageType) {
      case HomePageType.dashboard:
        return _buildDashboard();
      case HomePageType.loja:
        return _buildLoja();
      case HomePageType.produtos:
        return _buildProdutos();
      case HomePageType.streaming:
        return _buildStreaming();
      case HomePageType.afiliacoes:
        return _buildAfiliacoes();
      case HomePageType.responsaveis:
        return _buildResponsaveis();
      case HomePageType.ferramentas:
        return _buildFerramentas();
      case HomePageType.relatorios:
        return _buildRelatorios();
      case HomePageType.configuracoes:
        return _buildConfiguracoes();
    }
  }

  Widget _buildDashboard() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.dashboard, size: 64, color: Color(0xFF6B46C1)),
          SizedBox(height: 16),
          Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Bem-vindo ao seu painel principal',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildLoja() {
    final PageController pageController = PageController();
    final RxInt currentPageIndex = 0.obs;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Seção de boas-vindas
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Olá, Arthur Neves Sousa Cipriano',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Seja bem vindo!',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xFF6B46C1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Banner promocional - Carousel
          Container(
            margin: const EdgeInsets.all(20),
            height: 200,
            child: Stack(
              children: [
                // Carousel de imagens
                PageView.builder(
                  controller: pageController,
                  itemCount: 3,
                  onPageChanged: (index) {
                    currentPageIndex.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage('assets/news.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                // Indicadores de página
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPageIndex.value == index 
                              ? Colors.white 
                              : Colors.white.withOpacity(0.4),
                        ),
                      );
                    }),
                  )),
                ),
              ],
            ),
          ),

          // Título da seção Loja
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Loja',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

                              // Lista de produtos
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3, // Número de produtos para exibir
                      itemBuilder: (context, index) {
                        return ProductListItem(
                          key: ValueKey('product_$index'),
                        );
                      },
                    ),

                    // Paginação
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('< Previous', style: TextStyle(color: Colors.black87)),
                          ),
                          const SizedBox(width: 20),
                          _buildPageNumber(1, false),
                          const SizedBox(width: 10),
                          _buildPageNumber(2, true), // Página atual
                          const SizedBox(width: 10),
                          _buildPageNumber(3, false),
                          const SizedBox(width: 10),
                          const Text('...', style: TextStyle(color: Colors.black87)),
                          const SizedBox(width: 20),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Next >', style: TextStyle(color: Colors.black87)),
                          ),
                        ],
                      ),
                    ),
        ],
      ),
    );
  }

  Widget _buildProdutos() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_basket, size: 64, color: Color(0xFF6B46C1)),
          SizedBox(height: 16),
          Text(
            'Produtos',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Gerencie seus produtos aqui',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildStreaming() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.play_circle_outline, size: 64, color: Color(0xFF6B46C1)),
          SizedBox(height: 16),
          Text(
            'Streaming',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Conteúdo em streaming disponível',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildAfiliacoes() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: 64, color: Color(0xFF6B46C1)),
          SizedBox(height: 16),
          Text(
            'Afiliações',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Gerencie suas afiliações',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsaveis() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_outline, size: 64, color: Color(0xFF6B46C1)),
          SizedBox(height: 16),
          Text(
            'Responsáveis',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Lista de responsáveis',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFerramentas() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.build, size: 64, color: Color(0xFF6B46C1)),
          SizedBox(height: 16),
          Text(
            'Ferramentas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Ferramentas disponíveis',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatorios() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 64, color: Color(0xFF6B46C1)),
          SizedBox(height: 16),
          Text(
            'Relatórios',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Visualize seus relatórios',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildConfiguracoes() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Color(0xFF6B46C1)),
          SizedBox(height: 16),
          Text(
            'Configurações',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Configure suas preferências',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 29),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Topo roxo com gradiente - Icon Card
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              height:   230,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF5B35A1), // Roxo mais escuro
                    Color(0xFF6B46C1), // Roxo mais claro
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Círculo branco simples
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Título
                  const Text(
                    'Icon Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Descrição
                  Text(
                    'Beautifully designed components built with Radix UI and Tailwind CSS.',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            // Detalhes do produto
            Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Título Produtos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Código: pro9y89x',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Barra de progresso
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Color(0xFF6B46C1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.flash_on,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.yellow, Colors.orange],
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '150',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Watt's",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Categoria: Marketing e Comunicação',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Produtor: Tamiris De Cezaro',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Preço: R\$ 10,90 a R\$ 597,00',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Botão
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF795dff),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Ver Informações',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageNumber(int number, bool isActive) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF6B46C1) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? const Color(0xFF6B46C1) : Colors.grey[300]!,
        ),
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black87,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
