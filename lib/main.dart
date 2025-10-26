import 'package:flutter/material.dart';

// --- IMPORTS DE TODAS AS TELAS MODULARES (Em Ordem Alfabética) ---
import 'package:focus_app/telas/acessibilidade.dart';
import 'package:focus_app/telas/adiciona_novameta.dart';
import 'package:focus_app/telas/conheça_equipe.dart';
import 'package:focus_app/telas/constants.dart';
import 'package:focus_app/telas/editar_meta.dart'; // <<< AGORA IMPORTA EDITARMETASCREEN
import 'package:focus_app/telas/login.dart';
import 'package:focus_app/telas/postagem.dart';
import 'package:focus_app/telas/redefinir_senha.dart';
import 'package:focus_app/telas/splash_screen.dart';
import 'package:focus_app/telas/tela_cadastro.dart';
import 'package:focus_app/telas/tela_configuracao.dart';
import 'package:focus_app/telas/tela_metas.dart';
import 'package:focus_app/telas/tela_perfil.dart';

// ----------------------------------------------------
// FUNÇÃO MAIN E CLASSE PRINCIPAL DO APP
// ----------------------------------------------------

void main() {
  runApp(const FocusApp());
}

class FocusApp extends StatelessWidget {
  const FocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: kPrimaryColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        useMaterial3: true,
      ),

      initialRoute: '/splash',

      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/metas': (context) => const MetasScreen(),
        // AQUI: Chama a classe EditarMetaScreen do arquivo editar_meta.dart
        '/correr': (context) => const EditarMetaScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/redefinir_senha': (context) => const RedefinirSenhaScreen(),
        '/configuracao': (context) => const ConfiguracaoScreen(),
        '/acessibilidade': (context) => const AcessibilidadeScreen(),
        '/postagem': (context) => const PostagemScreen(),
        '/adicionar_meta': (context) => const AdicionarMetaScreen(),
        '/equipe': (context) => const ConhecaEquipeScreen(),
      },
    );
  }
}
