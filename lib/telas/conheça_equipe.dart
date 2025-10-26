import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- WIDGET AUXILIAR PARA O CARD DO MEMBRO DA EQUIPE ---
// Manter este método fora da classe principal o torna um widget auxiliar reutilizável
Widget _buildTeamMemberCard({
  required String name,
  required String role,
  required String contribution,
  required String photoAsset, // Caminho do asset da foto
}) {
  const TextStyle nameStyle = TextStyle(
    color: Color.fromARGB(255, 18, 75, 144), // Cor escura para destaque
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  const TextStyle detailStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: kSecondaryColor, // Fundo azul claro
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar do Membro
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.asset(
              photoAsset, // Usa o caminho da foto passada
              fit: BoxFit.cover,
              width: 70, 
              height: 70,
              errorBuilder: (context, error, stackTrace) {
                // Fallback caso a imagem não seja encontrada
                return const Icon(Icons.person, size: 40, color: kButtonColor);
              },
            ),
          ),
        ),
        const SizedBox(width: 15),

        // Detalhes do Membro
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: nameStyle),
              const SizedBox(height: 5),
              Text(role, style: detailStyle),
              const Text('Curso: ADS', style: detailStyle),
              const Text('Período: 4º Período', style: detailStyle),
              const SizedBox(height: 10),
              Text('Contribuição: $contribution', style: detailStyle),
            ],
          ),
        ),
      ],
    ),
  );
}

// --- TELA CONHEÇA A EQUIPE ---
class ConhecaEquipeScreen extends StatelessWidget {
  const ConhecaEquipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text('Equipe', style: kPageTitleStyle),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card da Camyla
            _buildTeamMemberCard(
              name: 'CAMYLA ANDRADE',
              role: 'Co-Fundadora & Desenvolvedora',
              contribution:
                  'Desenvolvimento do APP, Experiência do Usuário (UX) e Design de Interfaces (UI).',
              photoAsset: 'assets/imgs/CAMYLA.jpg', // Caminho da foto
            ),

            // Card da Nalanda
            _buildTeamMemberCard(
              name: 'NALANDA REIS',
              role: 'Co-Fundadora & Desenvolvedora',
              contribution:
                  'Desenvolvimento do APP, e Design.',
              photoAsset: 'assets/imgs/NALANDA.jpg', // Caminho da foto
            ),

            const SizedBox(height: 40),

            // Rodapé
            Center(
              child: Column(
                children: [
                  const Text(
                    '© 2025 App Focus.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Desenvolvido por Camyla e Nalanda.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
