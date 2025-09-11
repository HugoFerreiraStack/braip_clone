import 'package:flutter/material.dart';

class PackagingSection extends StatefulWidget {
  const PackagingSection({super.key, this.onCriarNovaEmbalagem});

  final VoidCallback? onCriarNovaEmbalagem;

  @override
  State<PackagingSection> createState() => _EmbalagemPesoCardState();
}

class _EmbalagemPesoCardState extends State<PackagingSection> {
  static const roxo = Color(0xFF6B46C1);

  // Opções
  final _embalagens = const ['Economica', 'Grande', 'Pequena'];
  final _pesos = const [1, 2, 3, 4, 5, 6, 7];

  // Estado selecionado
  String? _embalagemSel;
  int? _pesoSel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26, // sombra preta suave
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título com ícone
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/open_box_purple.png'),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Selecione a embalagem e o peso do produto abaixo",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Borda cinza envolvendo os campos
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Embalagem
                      const Text(
                        "Embalagem *",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        value: _embalagemSel,
                        hint: const Text("Selecione"),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        items: _embalagens
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (val) => setState(() => _embalagemSel = val),
                        decoration: _fieldDecoration(context),
                      ),

                      const SizedBox(height: 12),

                      // Peso
                      const Text(
                        "Peso (Kg) *",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<int>(
                        value: _pesoSel,
                        hint: const Text("5.000"),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        items: _pesos
                            .map(
                              (n) => DropdownMenuItem<int>(
                                value: n,
                                child: Text(n.toString()),
                              ),
                            )
                            .toList(),
                        onChanged: (val) => setState(() => _pesoSel = val),
                        decoration: _fieldDecoration(context),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Botão outlined à esquerda, tamanho mínimo
                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton.icon(
                    onPressed: widget.onCriarNovaEmbalagem,
                    icon: const Icon(Icons.add, size: 18, color: roxo),
                    label: const Text(
                      "Criar nova embalagem",
                      style: TextStyle(
                        color: roxo,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: roxo, width: 1.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          999,
                        ), // borda arredondada
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      foregroundColor: roxo,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // VOLTAR (outlined cinza, sem ação)
                Expanded(
                  child: OutlinedButton(
                    onPressed: null, // sem ação
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade400, width: 1.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      foregroundColor: Colors.grey.shade700,
                      disabledForegroundColor: Colors.grey.shade700,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Voltar'),
                  ),
                ),
                const SizedBox(width: 12),
                // SALVAR (roxo) — coleta os dados; envio REAL comentado
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: roxo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      elevation: 0,
                    ),
                    child: const Text('Continuar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Estilo padrão dos campos
  InputDecoration _fieldDecoration(BuildContext context) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      hintStyle: const TextStyle(color: Colors.black54),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: roxo, width: 1.6),
      ),
      // seta já está como ícone à direita via `icon:`
    );
  }
}
