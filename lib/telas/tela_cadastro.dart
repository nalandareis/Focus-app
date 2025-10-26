import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- TELA DE CADASTRO ---
class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  // Método auxiliar para construir campos de texto
  Widget _buildTextField({
    required String label,
    required String hint,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: kSecondaryColor,
              // Estilo de borda padrão herdado do main.dart, 
              // mas para um estilo mais detalhado como na tela de Login:
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Substituímos o Text('Focus') pela sua logo no AppBar
        title: Image.asset(
          // O CAMINHO ESTÁ CORRETO: assets/imgs/logo_cadastro.png
          'assets/imgs/logo_cadastro.png', 
          height: 60, 
          errorBuilder: (context, error, stackTrace) {
            // Caso a imagem não carregue, voltamos ao Text 'Focus' usando o estilo das constantes
            return const Text('Focus', style: kPageTitleStyle);
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildTextField(label: 'Nome:', hint: 'Nome'),
            _buildTextField(label: 'Usuário:', hint: 'Usuário'),
            _buildTextField(label: 'E-mail:', hint: 'E-mail'),
            _buildTextField(
              label: 'Crie uma senha:',
              hint: 'Senha',
              obscureText: true,
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // >>> USANDO ROTA NOMEADA: /metas <<<
                  Navigator.pushNamed(context, '/metas');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.accessibility_new, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
