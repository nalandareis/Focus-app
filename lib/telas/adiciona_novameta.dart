import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- TELA ADICIONAR NOVA META ---
class AdicionarMetaScreen extends StatelessWidget {
  const AdicionarMetaScreen({super.key});

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
              color: Colors.black, // Cor forte para o label, destacando no fundo claro
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              // Mantenha o preenchimento, mas adicione opacidade para legibilidade
              filled: true,
              fillColor: Colors.white.withOpacity(0.9), // Campo branco semi-transparente
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: kButtonColor, width: 2.0),
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
      // 1. Torna o corpo da tela visível por trás da AppBar
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        // 2. Remove a cor de fundo da AppBar
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 90.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),

        // Substitui o ícone pela imagem de asset
        title: Padding( // <-- NOVO: Adiciona Padding aqui
          padding: const EdgeInsets.only(top: 40.0), // Ajuste este valor (10.0) para a quantidade que você deseja descer.
          child: Image.asset(
            'assets/imgs/nova_meta.png',
            height: 80,
            color: kButtonColor,
          ),
        ), // <-- FIM do Padding

        centerTitle: true,
      ),
      body: Container(
        // CORREÇÃO: Usa BoxConstraints.expand() para forçar o Container
        // a preencher toda a altura e largura do Scaffold.
        constraints: const BoxConstraints.expand(),

        // 3. Adiciona a Imagem de Fundo
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/index.png'),
            fit: BoxFit.cover, // Mantém o BoxFit.cover para cobrir o espaço
          ),
        ),
        child: SingleChildScrollView(
          // Adiciona padding na parte superior para que o conteúdo não fique sob a AppBar
          padding: const EdgeInsets.fromLTRB(24.0, 130.0, 24.0, 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Conteúdo do formulário
              _buildTextField(
                label: 'Título da Meta:',
                hint: 'Ex: Ler 10 páginas',
              ),
              _buildTextField(label: 'Prazo:', hint: 'Ex: 31/12/2025'),
              _buildTextField(label: 'Categoria:', hint: 'Ex: Saúde, Estudo...'),

              // ========================================================
              const SizedBox(height: 70),
              // =========================================================

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
                    // Lógica para criar a meta
                    Navigator.pop(context); // Simula a criação da meta e volta
                  },
                  child: const Text(
                    'Criar Meta',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}