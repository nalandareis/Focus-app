import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart';

import '../services/mock_data_service.dart';
import '../models/usuaria.dart';

class PerfilScreen extends StatelessWidget {
  PerfilScreen({super.key});

  final MockDataService _service = MockDataService();

  InputDecoration _perfilInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: kButtonColor, fontSize: 18),
      filled: true,
      fillColor: kSecondaryColor.withOpacity(0.8),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: kButtonColor, width: 2.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Usuaria usuaria = _service.usuariaLogada;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: Image.asset('assets/imgs/perfil.png', fit: BoxFit.contain),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.edit, color: kButtonColor),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/index.png'),
            fit: BoxFit.cover,
          ),
        ),
        // === INÍCIO DA CORREÇÃO DE LAYOUT: USANDO COLUMN E EXPANDED ===
        child: Column(
          children: [
            Expanded( // Força o SingleChildScrollView a ocupar o espaço total vertical
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24.0, 100.0, 24.0, 24.0),
                child: Center(
                  child: Column(
                    children: [
                      // IMAGEM DE PERFIL DINÂMICA
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: kPrimaryColor,
                        child: ClipOval(
                          child: Image.asset(
                            usuaria.fotoUrl,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.person,
                                size: 70,
                                color: kButtonColor,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          initialValue: usuaria.usuario,
                          decoration: _perfilInputDecoration('Usuário'),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          initialValue: usuaria.descricao,
                          decoration: _perfilInputDecoration('Sobre mim'),
                          style: const TextStyle(fontSize: 18),
                          maxLines: 5,
                          minLines: 3,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kButtonColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Salvar Alterações',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // Adicione um espaço final grande o suficiente para empurrar o conteúdo
                      // e garantir que o scroll funcione, se necessário.
                      // Se o conteúdo for menor que a tela, essa altura não será visível.
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // === FIM DA CORREÇÃO DE LAYOUT ===
      ),
    );
  }
}