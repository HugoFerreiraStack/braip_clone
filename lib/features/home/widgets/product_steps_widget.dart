import 'package:braip_clone/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:braip_clone/config/themes/app_assets.dart';

class ProductStepsWidget extends StatelessWidget {
  final int currentStep;
  final Function(int) onStepChanged;

  const ProductStepsWidget({
    super.key,
    required this.currentStep,
    required this.onStepChanged,
  });

  @override
  Widget build(BuildContext context) {
    final totalSteps = 5;
    final progress = (currentStep + 1) / totalSteps;

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Primeira linha: imagem e título
              Row(
                children: [
             Image.asset(
                      AppAssets.add,
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  const SizedBox(width: 16),
                   Text(
                    'Novo produto',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Segunda linha: texto sobre campos obrigatórios
              Text(
                'Campos assinalados com asterisco (*) são obrigatórios.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // Progress Bar
          Container(
            width: double.infinity,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Step Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStepIndicator(0, 'Detalhes', currentStep),
              _buildStepIndicator(1, 'Configurações\nde venda', currentStep),
              _buildStepIndicator(2, 'Embalagem', currentStep),
              _buildStepIndicator(3, 'Entrega', currentStep),
              _buildStepIndicator(4, 'Afiliação', currentStep),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int stepIndex, String label, int currentStep) {
    final isActive = stepIndex == currentStep;
    final isCompleted = stepIndex < currentStep;

    return GestureDetector(
      onTap: () => onStepChanged(stepIndex),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Step Circle - sempre alinhado no topo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isActive || isCompleted
                  ? AppColors.primary
                  : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${stepIndex + 1}',
                style: TextStyle(
                  color: isActive || isCompleted ? Colors.white : Colors.grey[600],
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Step Label - com altura fixa para manter alinhamento
          SizedBox(
            height: 32, // Altura fixa para o texto
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.black87 : Colors.grey[600],
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
