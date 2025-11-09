import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- TELA DE POSTAGEM ---
class PostagemScreen extends StatelessWidget {
  const PostagemScreen({super.key});

  Widget _buildPostCard({
    required String user,
    required String text,
    required String profileImagePath,
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
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),

        // ✅ Substituição do texto pela logo
        title: Image.asset(
          'assets/imgs/logo_cadastro2.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/index.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
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

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildPostCard(
                    user: 'claramartins',
                    text: 'Hoje corri 5Km !!!',
                    profileImagePath: 'assets/imgs/mascara.jpg',
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
