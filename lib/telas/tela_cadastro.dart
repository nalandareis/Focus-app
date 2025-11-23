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
              // Estilo de borda: arredondado sem borda visível
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
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
          'assets/imgs/logo.png',
          height: 60, 
          errorBuilder: (context, error, stackTrace) {
            // Caso a imagem não carregue, voltamos ao Text 'Focus'
            return const Text('Focus', style: kPageTitleStyle);
          },
        ),
        centerTitle: true,
        // Adiciona um botão de voltar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
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
            
            // --- Botão e Ícone de Acessibilidade em uma Row Centralizada ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza a Row
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    // Define o padding para controlar o tamanho do botão
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // Removendo minimumSize.infinity para que o botão não ocupe toda a largura
                  ),
                  onPressed: () {
                    // >>> USANDO ROTA NOMEADA: /metas <<<
                    Navigator.pushNamed(context, '/metas');
                  },
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                
                const SizedBox(width: 20),
                
                // Ícone de Acessibilidade fora do botão, como no design
                const Icon(
                  Icons.accessibility_new,
                  color: kButtonColor, // Cor de destaque
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}