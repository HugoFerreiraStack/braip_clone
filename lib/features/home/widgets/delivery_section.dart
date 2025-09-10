import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeliverySection extends StatefulWidget {
  const DeliverySection({super.key});

  @override
  State<DeliverySection> createState() => _ConfiguracoesEntregaCardState();
}

class _ConfiguracoesEntregaCardState extends State<DeliverySection> {
  static const roxo = Color(0xFF6B46C1);

  // Controllers
  final _cepController = TextEditingController();
  final _valorFreteController = TextEditingController();

  // Estado do dropdown "Tipo de frete"
  String? _tipoFreteSel;
  final _tiposFrete = const ["Variavel", "Gratis"];

  @override
  void dispose() {
    _cepController.dispose();
    _valorFreteController.dispose();
    super.dispose();
  }

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
              borderRadius: BorderRadius.circular(5),
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
                // Título
                const Text(
                  'Configuracoes de entrega',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 12),

                // CEP de origem
                const Text(
                  "CEP de origem *",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _cepController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(), // máscara #####-###
                  ],
                  decoration: _fieldDecoration(hintText: "00000-000"),
                ),

                const SizedBox(height: 16),

                // Tipo de frete
                const Text(
                  "Tipo de frete *",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  value: _tipoFreteSel,
                  hint: const Text("Frete variavel ou Gratis"),
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  items: _tiposFrete
                      .map(
                        (e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)),
                      )
                      .toList(),
                  onChanged: (val) => setState(() => _tipoFreteSel = val),
                  decoration: _fieldDecoration(),
                ),

                const SizedBox(height: 16),

                // Valor padrão do frete
                const Text(
                  "Valor padrao do frete *",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _valorFreteController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    // permite dígitos, vírgula e ponto (se quiser máscara real depois dá pra trocar)
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9,\.]')),
                  ],
                  decoration: _fieldDecoration(
                    hintText: "R\$ 0,00",
                    // Ícone ? clicável dentro do input abrindo um balão (tooltip)
                    suffixIcon: Tooltip(
                      message: "Digite o valor padrao do frete",
                      preferBelow: true,
                      child: IconButton(
                        onPressed: () {
                          // opcional: também pode abrir um SnackBar/Dialog aqui
                        },
                        icon: const Icon(Icons.help_outline_rounded),
                        color: roxo,
                      ),
                    ),
                  ),
                ),
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
  InputDecoration _fieldDecoration({String? hintText, Widget? suffixIcon}) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black54),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: roxo, width: 1.6),
      ),
    );
  }
}

/// Formatter simples para CEP brasileiro no formato #####-###
class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 8) digits = digits.substring(0, 8);

    String formatted;
    if (digits.length <= 5) {
      formatted = digits;
    } else {
      formatted = '${digits.substring(0, 5)}-${digits.substring(5)}';
    }

    // Mantém o cursor no fim de forma segura
    final selIndex = formatted.length;
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selIndex),
    );
  }
}
