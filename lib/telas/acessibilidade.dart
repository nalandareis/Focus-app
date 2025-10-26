import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- TELA DE ACESSIBILIDADE ---
class AcessibilidadeScreen extends StatelessWidget {
  const AcessibilidadeScreen({super.key});

  // Método auxiliar para construir cada item de acessibilidade
  Widget _buildAccessibilityItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black54, // Usando cor escura para contraste no fundo claro
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor, // Usa a cor de fundo definida nas constantes
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Acessibilidade', style: kPageTitleStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccessibilityItem('Modo de alto contraste'),
            _buildAccessibilityItem('Tamanho da fonte'),
            _buildAccessibilityItem('Tema de Cores'),
            _buildAccessibilityItem('Navegação por teclado'),
            _buildAccessibilityItem('Feedback auditivo'),
            _buildAccessibilityItem('Leitores de tela'),
          ],
        ),
      ),
    );
  }
}
