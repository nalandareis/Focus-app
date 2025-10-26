import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart';

// Importa as classes necessárias para navegação (se precisar de rotas não nomeadas)
// Para manter a consistência, usaremos rotas nomeadas (/metas, /cadastro, etc.)

// --- TELA DE LOGIN (ATUALIZADA com Botão Equipe) ---
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Função auxiliar para criar os campos de texto estilizados
  InputDecoration _customInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: kSecondaryColor,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: kButtonColor, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLoginBackground, // Usando a nova constante
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 2),
            // Logo (Presume-se que o asset existe; se não, use Text('Focus', style: kFocusTitleStyle))
            // Como não tenho o asset 'assets/imgs/logo.png', vou usar o Text com o estilo:
            // Image.asset('assets/imgs/logo.png', height: 80), 
            const Text('Focus', style: kFocusTitleStyle),
            const Spacer(flex: 1),
            const SizedBox(height: 20),

            // Campo E-MAIL
            TextField(
              decoration: _customInputDecoration('E-mail'),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16),

            // Campo SENHA
            TextField(
              decoration: _customInputDecoration('Senha'),
              obscureText: true,
            ),

            const SizedBox(height: 24),

            // Botão ENTRAR
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // >>> USANDO ROTA NOMEADA <<<
                Navigator.pushNamed(context, '/metas');
              },
              child: const Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Botão Esqueceu a senha?
            TextButton(
              onPressed: () {
                // >>> USANDO ROTA NOMEADA <<<
                Navigator.pushNamed(context, '/redefinir_senha');
              },
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  color: kLoginTextColor, // Usando a nova constante
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const Spacer(flex: 1), 
            
            // NOVO BOTÃO: CONHEÇA A EQUIPE
            TextButton(
              onPressed: () {
                // >>> USANDO ROTA NOMEADA <<<
                Navigator.pushNamed(context, '/equipe');
              },
              child: Text(
                'Conheça a Equipe',
                style: TextStyle(
                  color: kLoginTextColor, // Usando a nova constante
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Spacer(flex: 1), 
            
            // Link Cadastrar-se
            GestureDetector(
              onTap: () {
                // >>> USANDO ROTA NOMEADA <<<
                Navigator.pushNamed(context, '/cadastro');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cadastrar-se',
                    style: TextStyle(
                      color: kLoginTextColor, // Usando a nova constante
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.accessibility_new, color: kButtonColor),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
