import 'package:flutter/material.dart';
import 'dart:async'; // Necessário para usar Timer
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// Definindo a duração do splash screen
const int _splashDurationSeconds = 3;

// --- TELA DE SPLASH (CORRIGIDA) ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    // Configura o timer para ir para a tela de Login após 3 segundos
    Timer(const Duration(seconds: _splashDurationSeconds), () {
      // Usamos pushReplacementNamed para que o usuário não possa voltar para o splash
      // A rota '/' no main.dart aponta para LoginScreen
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/'); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usando a cor de fundo definida nas constantes do Login
      backgroundColor: kLoginBackground, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ADICIONANDO A LOGO RENOMEADA
            Image.asset(
              'assets/imgs/logo.png', // CAMINHO CORRETO baseado nos seus assets
              width: 250,
              errorBuilder: (context, error, stackTrace) {
                // Fallback de texto se a logo não carregar
                 return const Text('Focus', style: kFocusTitleStyle);
              },
            ),

            const SizedBox(height: 40),

            // Indicador de Carregamento
            CircularProgressIndicator(color: kButtonColor),
            
            const SizedBox(height: 100),
            
            // Versão da Equipe (Rodapé)
            Text(
              'Versão 1.0.0\nDesenvolvido pela Equipe ADS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kLoginTextColor.withOpacity(0.8),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
