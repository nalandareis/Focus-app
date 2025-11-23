import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// NOVOS IMPORTS
import '../services/mock_data_service.dart';
import '../models/lembrete.dart';

// --- TELA DE CONFIGURAÇÃO ---
class ConfiguracaoScreen extends StatelessWidget {
  ConfiguracaoScreen({super.key});

  final MockDataService _service = MockDataService();

  // Método auxiliar para construir seções de configurações
  Widget _buildSettingsSection(
      BuildContext context, {
        required String title,
        required List<Widget> items,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kButtonColor,
          ),
        ),
        const SizedBox(height: 8),
        ...items.map(
              (item) => Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: item,
          ),
        ),
      ],
    );
  }

  // NOVO: Constrói a lista de Lembretes (Listagem 4)
  List<Widget> _buildLembretes() {
    final List<Lembrete> lembretes = _service.lembretesAtivos; // Listagem 4

    if (lembretes.isEmpty) {
      return [
        const Text(
          'Nenhum lembrete ativo.',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        )
      ];
    }

    return lembretes.map((lembrete) => InkWell(
      onTap: () {
        // Lógica de clique no lembrete
      },
      child: Text(
        '${lembrete.titulo}: ${lembrete.descricao}', // Exibe dados do Mock
        style: const TextStyle(
          fontSize: 16,
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      ),
    )).toList();
  }

  // Método auxiliar para criar itens estáticos (não lembretes) ou rotas
  Widget _buildStaticItem(BuildContext context, String text, {String? route}) {
    return InkWell(
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // Itens estáticos que permanecem (usando _buildStaticItem para facilitar)
    final List<Widget> contaItems = [
      _buildStaticItem(context, 'Gerenciamento de perfil e informações pessoais'),
      _buildStaticItem(context, 'Configurações de Segurança e autenticação'),
    ];

    final List<Widget> privacidadeItems = [
      _buildStaticItem(context, 'Controle de quem pode ver suas metas e progresso'),
    ];

    final List<Widget> acessibilidadeItems = [
      _buildStaticItem(context, 'Acessibilidade', route: '/acessibilidade'),
    ];

    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Configuração', style: kPageTitleStyle),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // USA A LISTAGEM 4 (Lembretes)
              _buildSettingsSection(
              context,
              title: 'Notificação e lembretes',
              items: _buildLembretes(),
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(context,
                title: 'Configurações de Acesso e Conta',
                items: contaItems,),

            const SizedBox(height: 24),
            _buildSettingsSection(context,
                title: 'Controle de privacidade',
                items: privacidadeItems),

            const SizedBox(height: 24),
            _buildSettingsSection(context,
                title: 'Acessibilidade',
                items: acessibilidadeItems,),
              ]
            ),
        ),
    );
  }
}