import 'package:flutter/material.dart';

class AffiliationSection extends StatefulWidget {
  const AffiliationSection({super.key});

  @override
  State<AffiliationSection> createState() => _AffiliationSectionState();
}

enum CommissionType { percentage, fixed }

class _AffiliationSectionState extends State<AffiliationSection> {
  static const roxo = Color(0xFF6B46C1);

  // Toggles
  bool _participarPrograma = false;
  bool _visivelNaLoja = false;
  bool _aprovacaoAutomatica = false;
  bool _acessoDadosComprador = false;

  // Dropdowns
  String?
  _tipoComissionamento; // hint: "Primeiro Clique" | itens: ["Padrão","Premio"]
  String? _tempoCookie; // hint: "Eterno" | itens: ["Diario","Semanal","Eterno"]

  // Radios
  CommissionType _tipoComissao = CommissionType.percentage;

  // Campo de valor
  final _valorComissaoCtrl = TextEditingController();

  @override
  void dispose() {
    _valorComissaoCtrl.dispose();
    super.dispose();
  }

  Map<String, dynamic> collectFormData() {
    return {
      'participarProgramaAfiliados': _participarPrograma,
      'visivelNaLoja': _visivelNaLoja,
      'aprovacaoAutomatica': _aprovacaoAutomatica,
      'acessoDadosComprador': _acessoDadosComprador,
      'tipoComissionamento': _tipoComissionamento,
      'tempoCookie': _tempoCookie,
      'tipoComissao': _tipoComissao == CommissionType.percentage
          ? 'Porcentagem'
          : 'Valor fixo',
      'valorComissao': _valorComissaoCtrl.text.trim(),
    };
  }

  @override
  Widget build(BuildContext context) {
    const tituloStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15,
      color: Colors.black87,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ====== CONTAINER PRINCIPAL ======
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Comissionamento de afiliados', style: tituloStyle),
              const SizedBox(height: 12),

              _label("Participar do Programa de Afiliados?"),
              const SizedBox(height: 6),
              _toggle(
                value: _participarPrograma,
                onChanged: (v) => setState(() => _participarPrograma = v),
              ),
              const SizedBox(height: 14),

              _label("Visível na loja?"),
              const SizedBox(height: 6),
              _toggle(
                value: _visivelNaLoja,
                onChanged: (v) => setState(() => _visivelNaLoja = v),
              ),
              const SizedBox(height: 14),

              _label("Aprovação automatica?"),
              const SizedBox(height: 6),
              _toggle(
                value: _aprovacaoAutomatica,
                onChanged: (v) => setState(() => _aprovacaoAutomatica = v),
              ),
              const SizedBox(height: 14),

              _label("Acesso aos dados do comprador?"),
              const SizedBox(height: 6),
              _toggle(
                value: _acessoDadosComprador,
                onChanged: (v) => setState(() => _acessoDadosComprador = v),
              ),
              const SizedBox(height: 16),

              _label("Tipo de comissionamento *"),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                value: _tipoComissionamento,
                hint: const Text("Primeiro Clique"),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items: const ["Padrão", "Premio"]
                    .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _tipoComissionamento = v),
                decoration: _dropdownDecoration(),
                style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
              ),
              const SizedBox(height: 16),

              _label("Tempo de cookie *"),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                value: _tempoCookie,
                hint: const Text("Eterno"),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items: const ["Diario", "Semanal", "Eterno"]
                    .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _tempoCookie = v),
                decoration: _dropdownDecoration(),
                style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Tempo que vai durar a indicação de venda',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 16),

              _label("Tipo de comissão"),
              const SizedBox(height: 6),
              Row(
                children: [
                  _radioTile(
                    label: "Porcentagem",
                    value: CommissionType.percentage,
                    groupValue: _tipoComissao,
                    onChanged: (v) => setState(() => _tipoComissao = v!),
                  ),
                  const SizedBox(width: 16),
                  _radioTile(
                    label: "Valor fixo",
                    value: CommissionType.fixed,
                    groupValue: _tipoComissao,
                    onChanged: (v) => setState(() => _tipoComissao = v!),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _label("Valor da comissão *"),
              const SizedBox(height: 6),
              TextFormField(
                controller: _valorComissaoCtrl,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: _fieldDecoration(hintText: "R\$ 0,00"),
              ),
            ],
          ),
        ),

        // ====== FORA DO CONTAINER: BOTÕES (Row + Expanded) ======
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                  onPressed: () {
                    final data = collectFormData();
                    // TODO: enviar o conteúdo do formulário:
                    // _enviarFormulario(data);
                    debugPrint('Affiliation form data: $data');
                  },
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
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  // ===== Helpers de UI =====

  Widget _label(String text) => Text(
    text,
    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
  );

  /// Toggle com trilho branco, borda cinza (1px) e thumb roxa quando ligado;
  /// desligado: trilho branco, borda cinza e thumb cinza (mesma cor da borda).
  Widget _toggle({required bool value, required ValueChanged<bool> onChanged}) {
    final borderGrey = Colors.grey.shade500;
    return Switch(
      value: value,
      onChanged: onChanged,
      // thumb
      thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
        final selected = states.contains(MaterialState.selected);
        return selected ? roxo : borderGrey;
      }),
      // trilho sempre branco
      trackColor: const MaterialStatePropertyAll<Color>(Colors.white),
      // borda do trilho sempre cinza 1px
      trackOutlineColor: MaterialStatePropertyAll<Color>(borderGrey),
      trackOutlineWidth: const MaterialStatePropertyAll<double>(1.0),
      // opcional: reduz o splash/área se quiser
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _radioTile({
    required String label,
    required CommissionType value,
    required CommissionType groupValue,
    required ValueChanged<CommissionType?> onChanged,
  }) {
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<CommissionType>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: roxo,
          ),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      filled: true,
      fillColor: Colors.grey.shade200, // dropdown cinza
      hintStyle: const TextStyle(color: Colors.black54),
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
        borderSide: BorderSide(color: Color(0xFF6B46C1), width: 1.6),
      ),
    );
  }

  InputDecoration _fieldDecoration({String? hintText}) {
    return InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black54),
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
        borderSide: BorderSide(color: Color(0xFF6B46C1), width: 1.6),
      ),
    );
  }
}
