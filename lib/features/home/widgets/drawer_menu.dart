import 'package:flutter/material.dart';
import 'package:braip_clone/features/home/presentations/controllers/home_controller.dart';

class DrawerMenu extends StatefulWidget {
  final HomeController controller;
  
  const DrawerMenu({super.key, required this.controller});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool _produtosExpanded = false;
  bool _afiliacoesExpanded = false;

  @override
  Widget build(BuildContext context) {
     return Drawer(
      child: Container(
        color: const Color(0xFF6B46C1), // Cor roxa principal
        child: Column(
          children: [
            // Header do drawer
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.white, size: 24),
                      ),
                      const Text(
                        'NEXUS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications, color: Colors.white, size: 24),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Arthur Neves Sousa Cipriano',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'arthur.neves@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            // Menu principal
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF5B35A1), // Cor roxa mais escura
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  children: [
                    _buildMenuItem(
                      icon: Icons.dashboard,
                      title: 'Dashboard',
                      onTap: () {
                        widget.controller.changePage(HomePageType.dashboard);
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.store,
                      title: 'Loja',
                      onTap: () {
                        widget.controller.changePage(HomePageType.loja);
                        Navigator.pop(context);
                      },
                    ),
                    _buildExpandableMenuItem(
                      icon: Icons.shopping_basket,
                      title: 'Produtos',
                      isExpanded: _produtosExpanded,
                      onTap: () {
                        setState(() {
                          _produtosExpanded = !_produtosExpanded;
                        });
                      },
                      children: [
                        _buildSubMenuItem(
                          icon: Icons.inventory,
                          title: 'Meus Produtos',
                          onTap: () {
                            widget.controller.changePage(HomePageType.meusProdutos);
                            Navigator.pop(context);
                          },
                        ),
                        _buildSubMenuItem(
                          icon: Icons.add_circle_outline,
                          title: 'Cadastrar Produto',
                          onTap: () {
                            widget.controller.changePage(HomePageType.cadastrarProduto);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    _buildMenuItem(
                      icon: Icons.play_circle_outline,
                      title: 'Streaming',
                      onTap: () {
                        widget.controller.changePage(HomePageType.streaming);
                        Navigator.pop(context);
                      },
                    ),
                    _buildExpandableMenuItem(
                      icon: Icons.people,
                      title: 'Afiliações',
                      isExpanded: _afiliacoesExpanded,
                      onTap: () {
                        setState(() {
                          _afiliacoesExpanded = !_afiliacoesExpanded;
                        });
                      },
                      children: const [],
                    ),
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'Responsáveis',
                      onTap: () {
                        widget.controller.changePage(HomePageType.responsaveis);
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.build,
                      title: 'Ferramentas',
                      onTap: () {
                        widget.controller.changePage(HomePageType.ferramentas);
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.bar_chart,
                      title: 'Relatórios',
                      onTap: () {
                        widget.controller.changePage(HomePageType.relatorios);
                        Navigator.pop(context);
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.settings,
                      title: 'Configurações',
                      onTap: () {
                        widget.controller.changePage(HomePageType.configuracoes);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 24),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    );
  }

  Widget _buildExpandableMenuItem({
    required IconData icon,
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.white, size: 24),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
        if (isExpanded) ...children,
      ],
    );
  }

  Widget _buildSubMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: const SizedBox(width: 24), // Espaçamento para alinhar com o item pai
      title: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }
}
