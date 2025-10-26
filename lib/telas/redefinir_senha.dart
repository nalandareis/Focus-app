import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- TELA DE REDEFINIÇÃO DE SENHA ---
class RedefinirSenhaScreen extends StatelessWidget {
  const RedefinirSenhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usando a cor de fundo do Login/Constantes, se definida, ou Primary
      backgroundColor: kLoginBackground, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // O AppBar deve ter o mesmo fundo da tela
        surfaceTintColor: Colors.transparent, 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 2),
            const Text('Focus', style: kFocusTitleStyle),
            const Spacer(flex: 1),
            const SizedBox(height: 20),
            const Text(
              'Redefinição de senha!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kButtonColor,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Informe um e-mail e enviaremos um link para recuperação da sua senha',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'E-mail',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kButtonColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Campo de texto estilizado
            const TextField(
              decoration: InputDecoration(
                hintText: 'E-mail',
                fillColor: Colors.white,
              ),
            ),
            const Spacer(flex: 2),
            // Botão ENVIAR
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text(
                'Enviar link de recuperação',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Icon(Icons.accessibility_new, color: kButtonColor),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
