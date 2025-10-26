import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- TELA DE POSTAGEM ---
class PostagemScreen extends StatelessWidget {
  const PostagemScreen({super.key});

  // Método auxiliar para construir os cartões de postagem
  Widget _buildPostCard({
    required String user,
    required String text,
    required String profileImagePath, // Caminho do asset da imagem de perfil
    bool hasImage = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar de Perfil
              CircleAvatar(
                radius: 20,
                backgroundColor: kSecondaryColor,
                child: ClipOval(
                  child: Image.asset(
                    profileImagePath,
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback para ícone caso a imagem não carregue
                      return const Icon(
                        Icons.person,
                        color: kButtonColor,
                        size: 24,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                user,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: kButtonColor,
                ),
              ),
              const Spacer(),
              const Icon(Icons.group, color: kButtonColor),
            ],
          ),
          const SizedBox(height: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
          if (hasImage) ...[
            const SizedBox(height: 12),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                // Imagem mockada para o post (ex: post_livros.jpg)
                child: Image.asset(
                  'assets/imgs/post_livros.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'Placeholder para Livros/Imagem',
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
            ),
          ],
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
        // Certifique-se de que o kPageTitleStyle usa uma cor legível (ele usa kButtonColor)
        title: const Text('Focus', style: kPageTitleStyle),
        centerTitle: true,
      ),
      body: Container(
        // 3. Adiciona a Imagem de Fundo (Assumindo 'assets/imgs/index.png' ou similar)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/index.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Adiciona um espaçamento para o conteúdo começar abaixo da AppBar transparente
            const SizedBox(height: 100),

            // --- CAMPO DE ESCRITA ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  // Cor semi-transparente para o campo de texto
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Escreva algo...',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.more_horiz, color: kButtonColor),
                    // Define a cor de fundo para ser igual ao container para garantir a transparência
                    fillColor: Colors.white.withOpacity(0.0),
                    filled: true,
                  ),
                ),
              ),
            ),

            // --- LISTA DE POSTAGENS ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildPostCard(
                    user: 'claramartins',
                    text: 'Hoje corri 5Km !!!',
                    profileImagePath:
                        'assets/imgs/mascara.jpg', // Usando imagem de máscara
                  ),
                  _buildPostCard(
                    user: 'Usuário2',
                    text: 'Achei esses livros incríveis !!!',
                    profileImagePath: 'assets/imgs/usuario2_livros.jpg',
                    hasImage: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // --- BARRA INFERIOR DE NAVEGAÇÃO ---
      bottomNavigationBar: Container(
        color: kPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.camera_alt, color: kButtonColor, size: 30),
            Icon(Icons.link, color: kButtonColor, size: 30),
            Icon(Icons.check_box_outlined, color: kButtonColor, size: 30),
          ],
        ),
      ),
    );
  }
}
