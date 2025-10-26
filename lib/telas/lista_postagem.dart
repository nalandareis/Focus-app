import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes


// --- TELA DE POSTAGEM ---
class PostagemScreen extends StatelessWidget {
  const PostagemScreen({super.key});

  // Método auxiliar para construir os cartões de postagem
  Widget _buildPostCard({
    required String user,
    required String text,
    required String profileAsset, // Caminho do asset da imagem de perfil
    bool hasImage = false,
  }) {
    // Define o avatar do post, usando o asset fornecido
    Widget userAvatar = CircleAvatar(
      radius: 20,
      backgroundColor: kSecondaryColor,
      child: ClipOval(
        child: Image.asset(
          profileAsset,
          fit: BoxFit.cover,
          width: 40,
          height: 40,
          errorBuilder: (context, error, stackTrace) {
            // Fallback para ícone caso a imagem não carregue
            return const Icon(Icons.person, color: kButtonColor, size: 24);
          },
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Cor semi-transparente
        borderRadius: BorderRadius.circular(15),
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
              userAvatar, // Avatar de Perfil
              const SizedBox(width: 10),
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
              // const Text('1h atrás', style: TextStyle(color: Colors.grey)), // Opção se quiser adicionar tempo
            ],
          ),
          const SizedBox(height: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
          if (hasImage) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                // Assumindo post_livros.jpg para o post com imagem
                'assets/imgs/post_livros.jpg',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    color: kSecondaryColor,
                    child: const Center(
                      child: Text(
                        'Imagem do Post não encontrada',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.favorite_border, size: 20, color: kButtonColor),
              Icon(Icons.comment_outlined, size: 20, color: kButtonColor),
              Icon(Icons.share, size: 20, color: kButtonColor),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Focus', style: kPageTitleStyle),
        centerTitle: true,
      ),
      body: Container(
        // Adiciona a Imagem de Fundo (Assumindo 'assets/imgs/index.png')
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/index.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Espaçamento para o conteúdo começar abaixo da AppBar transparente
            const SizedBox(height: 100),

            // --- CAMPO DE ESCRITA (TOPO) ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Escreva algo...',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.more_horiz, color: kButtonColor),
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
                  // POST 1: CLARAMARTINS - USANDO IMAGEM DE MÁSCARA
                  _buildPostCard(
                    user: 'claramartins',
                    text: 'Hoje corri 5Km !!!',
                    profileAsset: 'assets/imgs/mascara.jpg',
                  ),
                  const SizedBox(height: 16),

                  // POST 2: USUÁRIO 2 - USANDO IMAGEM DE LIVROS E TEM IMAGEM NO POST
                  _buildPostCard(
                    user: 'Usuário2',
                    text: 'Achei esses livros incríveis !!!',
                    hasImage: true,
                    profileAsset: 'assets/imgs/usuario2_livros.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // --- BARRA INFERIOR DE NAVEGAÇÃO ---
      bottomNavigationBar: Container(
        color: kPrimaryColor.withOpacity(0.9), // Cor semi-transparente
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
