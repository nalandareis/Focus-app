import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- TELA DE PERFIL ---
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  // Função auxiliar para criar a decoração estilizada dos campos
  InputDecoration _perfilInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: kButtonColor, fontSize: 18),
      // MANTENHA O FILL COLOR: Isso garante que o campo de texto ainda se destaque na imagem de fundo.
      filled: true,
      fillColor: kSecondaryColor.withOpacity(0.8), // Aumentei a opacidade para legibilidade
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),

      // Borda padrão
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none, // Borda sutil
      ),
      // Borda quando focado
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: kButtonColor, width: 2.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Torna o corpo da tela visível por trás da AppBar
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text('Perfil', style: kPageTitleStyle),
        // 2. Remove a cor de fundo para a imagem aparecer atrás
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
        // 3. Adiciona a Imagem de Fundo (usando a imagem de fundo que você tem)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/index.png'), 
            fit: BoxFit.cover, 
            // Fallback: se 'index.png' não for o fundo, use a cor base do app
            // Caso contrário, use color: kPrimaryColor
          ),
        ),
        child: SingleChildScrollView(
          // Adiciona padding na parte superior para que o conteúdo não fique sob a AppBar transparente
          padding: const EdgeInsets.fromLTRB(24.0, 100.0, 24.0, 24.0),
          child: Center(
            child: Column(
              children: [
                // --- Avatar de Perfil (Usando biografia.jpg) ---
                CircleAvatar(
                  radius: 60,
                  backgroundColor: kPrimaryColor,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/imgs/biografia.jpg', // Caminho do seu asset
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.person, size: 70, color: kButtonColor);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // --- CAMPO NOME DE USUÁRIO (EDITÁVEL) ---
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    initialValue: 'Nome do Usuário',
                    decoration: _perfilInputDecoration('Usuário'),
                    style: const TextStyle(fontSize: 18),
                    onChanged: (value) {
                      // Lógica para salvar o valor digitado
                    },
                  ),
                ),
                
                // --- CAMPO SOBRE MIM (EDITÁVEL, MÚLTIPLAS LINHAS) ---
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    initialValue: 'Escreva aqui sobre suas metas e paixões!',
                    decoration: _perfilInputDecoration('Sobre mim'),
                    style: const TextStyle(fontSize: 18),
                    maxLines: 5, // Permite 5 linhas
                    minLines: 3,
                    onChanged: (value) {
                      // Lógica para salvar o valor digitado
                    },
                  ),
                ),

                const SizedBox(height: 30),

                // Botão de Salvar
                ElevatedButton(
                  onPressed: () {
                    // Ação para salvar/editar perfil
                  },
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
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
