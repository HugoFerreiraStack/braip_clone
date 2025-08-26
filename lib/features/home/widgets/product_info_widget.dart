import 'package:braip_clone/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, ),
      child: Column(
        children: [
          // Informações do produto
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  // Categoria
                  _buildInfoRow('Categoria:', 'Marketing e Comunicação'),
                  const SizedBox(height: 12),
                  
                  // Produtor
                  _buildInfoRow('Produtor:', 'Tamiris De Cezaro'),
                  const SizedBox(height: 12),
                  
                  // Preço
                  _buildInfoRow('Preço:', 'R\$ 10,90 a R\$ 597,00'),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 25),
          
          // Botão Ver Informações
          Center(
            child: SizedBox(
              width: 250, // Largura fixa menor
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implementar ação do botão
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary, // Roxo igual ao ícone
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Ver Informações',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 8), // Espaçamento mínimo entre label e valor
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
