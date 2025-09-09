import 'package:braip_clone/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ResponsaveisCard extends StatefulWidget {
  const ResponsaveisCard({super.key, this.items, this.onAdd});

  /// Lista no formato:
  /// {name, type, cpfCnpj, update, status}
  final List<Map<String, String>>? items;
  final VoidCallback? onAdd;

  @override
  State<ResponsaveisCard> createState() => _ResponsaveisCardState();
}

class _ResponsaveisCardState extends State<ResponsaveisCard> {
  static const _pageSize = 10;
  final _hScrollController = ScrollController();

  int _currentPage = 1;

  List<Map<String, String>> get _allItems => widget.items ?? _mock;
  int get _total => _allItems.length;

  int get _endIndex => (_currentPage * _pageSize).clamp(0, _total);
  int get _startIndex => ((_currentPage - 1) * _pageSize).clamp(0, _total);

  List<Map<String, String>> get _pageItems =>
      _allItems.isEmpty ? const [] : _allItems.sublist(_startIndex, _endIndex);

  bool get _canGoPrev => _currentPage > 1;
  bool get _canGoNext => _endIndex < _total;

  void _goPrev() {
    if (_canGoPrev) setState(() => _currentPage--);
  }

  void _goNext() {
    if (_canGoNext) setState(() => _currentPage++);
  }

  @override
  void initState() {
    super.initState();
    _hScrollController.addListener(() {
      // atualiza o indicador custom de scroll
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _hScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const roxo = Color(0xFF6B46C1);
    final disabledColor = Colors.grey.shade400;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Todos os Responsáveis",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              // Botão redondo com ícone "add" branco e fundo roxo
              ElevatedButton(
                onPressed: widget.onAdd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: roxo,
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                ),
                child: const Icon(Icons.add, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // BLOCO ROLÁVEL HORIZONTAL (cabeçalho + itens)
          SingleChildScrollView(
            controller: _hScrollController,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 650,
              ), // menor que antes
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cabeçalho cinza com títulos (espaçamento menor)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        _HeaderCell("Nome", minWidth: 100),
                        _HeaderCell("Tipo", minWidth: 100),
                        _HeaderCell("CPF/CNPJ", minWidth: 120),
                        _HeaderCell("Atualização", minWidth: 110),
                        _HeaderCell("Status", minWidth: 100),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Lista vertical ou estado vazio (aparece dentro do mesmo scroll horizontal)
                  if (_allItems.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 8,
                      ),
                      child: Text(
                        'Você não possui nenhum registro cadastrado',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  else
                    Column(
                      children: _pageItems
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: _DataRowItem(
                                nome: e['name'] ?? '',
                                tipo: e['type'] ?? '',
                                cpfCnpj: e['cpfCnpj'] ?? '',
                                atualizacao: e['update'] ?? '',
                                status: e['status'] ?? '',
                              ),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // "Mostrando X até Y registros"
          Text(
            "Mostrando ${_endIndex} até ${_total} registros",
            style: const TextStyle(fontSize: 13, color: Colors.grey),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Paginação CENTRALIZADA
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _PagerButton(
                icon: Icon(
                  Icons.keyboard_double_arrow_left_rounded,
                  color: roxo,
                ),
                enabled: _canGoPrev,
                onTap: _goPrev,
              ),
              const SizedBox(width: 8),
              _PagerButton(
                icon: Icon(
                  Icons.keyboard_double_arrow_right_rounded,
                  color: roxo,
                ),
                enabled: _canGoNext,
                onTap: _goNext,
              ),
            ],
          ),

          const SizedBox(height: 10),

          // INDICADOR CUSTOM DE SCROLL HORIZONTAL (último elemento)
          _HScrollIndicator(
            controller: _hScrollController,
            trackColor: Colors.grey.shade400,
            thumbColor: Colors.black87,
            height: 8,
            borderRadius: 8,
          ),
        ],
      ),
    );
  }

  // Mock para testes
  static final _mock = <Map<String, String>>[
    {
      'name': 'Hugo',
      'type': 'Comprador',
      'cpfCnpj': '09920212',
      'update': 'Pedido',
      'status': 'Aprovado',
    },
    {
      'name': 'G',
      'type': 'Vendedor',
      'cpfCnpj': '121212',
      'update': 'Vendido',
      'status': 'Aguardando',
    },
    {
      'name': 'Hugo',
      'type': 'Comprador',
      'cpfCnpj': '09920212',
      'update': 'Pedido',
      'status': 'Aprovado',
    },
    {
      'name': 'G',
      'type': 'Vendedor',
      'cpfCnpj': '121212',
      'update': 'Vendido',
      'status': 'Aguardando',
    },
  ];
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.text, {this.minWidth = 120});

  final String text;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black, // títulos em preto
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _DataRowItem extends StatelessWidget {
  const _DataRowItem({
    required this.nome,
    required this.tipo,
    required this.cpfCnpj,
    required this.atualizacao,
    required this.status,
  });

  final String nome;
  final String tipo;
  final String cpfCnpj;
  final String atualizacao;
  final String status;

  @override
  Widget build(BuildContext context) {
    // Mesmas larguras do cabeçalho para manter alinhamento
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          _DataCell(text: nome, minWidth: 100),
          _DataCell(text: tipo, minWidth: 100),
          _DataCell(text: cpfCnpj, minWidth: 120),
          _DataCell(text: atualizacao, minWidth: 110),
          _DataCell(text: status, minWidth: 100),
        ],
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  const _DataCell({required this.text, this.minWidth = 110});

  final String text;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth),
      child: Text(
        text,
        textAlign: TextAlign.center, // centralizado
        style: TextStyle(
          color: Colors.grey.shade800, // registros em cinza
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Botão de paginação
class _PagerButton extends StatelessWidget {
  const _PagerButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  final Widget icon;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(999),
      child: icon,
    );
  }
}

/// Indicador custom de scroll horizontal (trilho cinza + thumb preto),
/// posicionado como um widget independente no final do container.
class _HScrollIndicator extends StatelessWidget {
  const _HScrollIndicator({
    required this.controller,
    required this.trackColor,
    required this.thumbColor,
    this.height = 8,
    this.borderRadius = 8,
  });

  final ScrollController controller;
  final Color trackColor;
  final Color thumbColor;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewport = controller.hasClients
            ? controller.position.viewportDimension
            : constraints.maxWidth;

        // Extensão toda do conteúdo rolável (se não tiver clients ainda, evita divisão por zero)
        final maxExtent = controller.hasClients
            ? controller.position.maxScrollExtent + viewport
            : viewport;

        final trackWidth = constraints.maxWidth;

        // Largura do polegar proporcional ao quanto do conteúdo cabe na viewport
        final thumbWidth = maxExtent > 0
            ? (viewport / maxExtent) * trackWidth
            : trackWidth;

        // Posição do polegar baseada no offset atual
        final offset = controller.hasClients ? controller.offset : 0.0;
        final maxOffset = controller.hasClients
            ? controller.position.maxScrollExtent
            : 0.0;

        final available = (trackWidth - thumbWidth).clamp(0, double.infinity);
        final thumbLeft = (maxOffset > 0)
            ? (offset / maxOffset) * available
            : 0.0;

        return Container(
          height: height,
          decoration: BoxDecoration(
            color: trackColor, // trilho cinza
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Stack(
            children: [
              Positioned(
                left: thumbLeft,
                top: 0,
                bottom: 0,
                width: thumbWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: thumbColor, // polegar preto
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
