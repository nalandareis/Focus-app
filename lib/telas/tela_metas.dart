import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- TELA DE METAS ---
class MetasScreen extends StatelessWidget {
  const MetasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        leading: IconButton(
          icon: const Icon(Icons.menu, color: kButtonColor),
          onPressed: () {
            Navigator.pushNamed(context, '/configuracao');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/perfil');
            },
            icon: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/imgs/biografia.jpg',
                  fit: BoxFit.cover,
                  width: 36,
                  height: 36,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100),

              // ✅ Substituição do texto "METAS" pela logo
              Center(
                child: Image.asset('assets/imgs/metasnome.png', height: 80),
              ),

              const SizedBox(height: 40),

              _buildMetaItem(
                context,
                'Correr',
                onTap: () => Navigator.pushNamed(context, '/correr'),
              ),
              _buildMetaItem(context, 'Ler'),
              _buildMetaItem(context, 'Beber 2L água'),

              const Spacer(),

              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/adicionar_meta');
                      },
                      child: const Text(
                        'Adicionar +',
                        style: TextStyle(color: kButtonColor, fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Icon(Icons.alternate_email, color: kButtonColor),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.black26),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/postagem');
                  },
                  child: const Text(
                    'Ver Posts',
                    style: TextStyle(color: kButtonColor, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetaItem(
    BuildContext context,
    String title, {
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
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
          child: CheckboxListTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            value: false,
            onChanged: (bool? value) {},
            activeColor: kButtonColor,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ),
    );
  }
}
