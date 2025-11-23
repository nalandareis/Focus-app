import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// NOVOS IMPORTS: Para usar o Mock Service e o Modelo Meta
import '../services/mock_data_service.dart';
import '../models/meta.dart';

// --- TELA DE METAS ---
class MetasScreen extends StatelessWidget {
  MetasScreen({super.key});

  // 1. Instancia o serviço de mock para acessar os dados
  final MockDataService _service = MockDataService();

  @override
  Widget build(BuildContext context) {
    // 2. Obtém a lista de Metas mockadas (Listagem 1)
    final List<Meta> metas = _service.metasDoUsuario;

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

              // Logo (Mantida)
              Center(
                child: Image.asset('assets/imgs/metasnome.png', height: 80),
              ),

              const SizedBox(height: 40),

              // --- LISTA DINÂMICA DE METAS (ListView.builder) ---
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero, // Remove o padding padrão do ListView
                  itemCount: metas.length, // Usa o tamanho da lista mockada
                  itemBuilder: (context, index) {
                    final meta = metas[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        // Navega para a tela de edição
                        onTap: () => Navigator.pushNamed(context, '/correr'),
                        child: Container(
                          decoration: BoxDecoration(
                            // Usa a cor de conclusão se meta.concluida for true
                            color: meta.concluida ? kCorConcluida : Colors.white.withOpacity(0.9),
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
                              meta.titulo, // DADO DINÂMICO: Título da Meta
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // Aplica linha se concluída
                                decoration: meta.concluida ? TextDecoration.lineThrough : null,
                              ),
                            ),
                            subtitle: Text(
                              meta.categoria, // DADO DINÂMICO: Categoria
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            value: meta.concluida, // DADO DINÂMICO: Status de conclusão
                            onChanged: (bool? value) {
                              // Aqui seria a lógica para marcar/desmarcar a meta
                            },
                            activeColor: kButtonColor,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // --- FIM DA LISTA DINÂMICA ---


              // Botões inferiores (Mantidos)
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
// O método _buildMetaItem NÃO é mais necessário e foi removido.
}