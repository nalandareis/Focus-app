import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- TELA DE CONFIGURAÇÃO ---
class ConfiguracaoScreen extends StatelessWidget {
  const ConfiguracaoScreen({super.key});

  // Método auxiliar para construir seções de configurações
  Widget _buildSettingsSection(
    BuildContext context, {
    required String title,
    required List<String> items,
    Function(String)? onTapItem, // Mantido para itens que não são rotas
  }) {
    // Mapa de rotas para navegação (item de texto -> nome da rota)
    final Map<String, String> routeMap = {
      'Acessibilidade': '/acessibilidade',
      // 'Mensagens' foi removido, mas se houvesse, seria: 'Mensagens': '/mensagens',
    };

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
            child: InkWell(
              onTap: () {
                // Tenta navegar para uma rota nomeada se existir no mapa
                if (routeMap.containsKey(item)) {
                  Navigator.pushNamed(context, routeMap[item]!);
                } else {
                  // Caso contrário, executa a função padrão (útil para toggles, etc.)
                  onTapItem?.call(item);
                }
              },
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
            _buildSettingsSection(
              context,
              title: 'Notificação e lembretes',
              items: [
                'Alerta para datas importantes',
                'Lembretes para tarefas diárias e semanais',
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              context,
              title: 'Configurações de Acesso e Conta',
              items: [
                'Gerenciamento de perfil e informações pessoais',
                'Configurações de Segurança e autenticação',
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              context,
              title: 'Controle de privacidade',
              items: ['Controle de quem pode ver suas metas e progresso'],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              context,
              title: 'Acessibilidade',
              items: ['Acessibilidade'], // A navegação usa a rota nomeada do map
            ),
          ],
        ),
      ),
    );
  }
}
