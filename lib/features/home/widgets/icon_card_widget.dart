import 'package:flutter/material.dart';

class IconCardWidget extends StatelessWidget {
  const IconCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        // Borda externa sólida azul
     
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Fundo com gradiente roxo-azul
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF271D59), // Roxo mais escuro
                  Color(0xFF403386), // Roxo médio
                  Color(0xFF4E3ABA), // Roxo mais claro
                ],
                stops: [0.0, 0.5, 1.0],
              ),
              borderRadius: BorderRadius.circular(14), // Menor que a borda externa
            ),
          ),
          
          // Borda interna pontilhada
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
        
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          
          // Conteúdo do card
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Círculo branco
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Título
                const Text(
                  'Icon Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Descrição
                Text(
                  'Beautifully designed components built with Radix UI and Tailwind CSS.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
