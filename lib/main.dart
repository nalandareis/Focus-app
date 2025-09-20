import 'package:flutter/material.dart';

// estilos fixos do app focus 
const Color kPrimaryColor = Color(0xFFD9E8F8);
const Color kSecondaryColor = Color(0xFFE9EEF5);
const Color kButtonColor = Color(0xFF5A9DEE);


const TextStyle kFocusTitleStyle = TextStyle(
  fontSize: 48,
  fontWeight: FontWeight.bold,
  color: kButtonColor,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black26,
      offset: Offset(4, 4),
    ),
  ],
);


const TextStyle kPageTitleStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: kButtonColor,
);

// --- Widget principal do aplicativo ---
void main() {
  runApp(const FocusApp());
}

class FocusApp extends StatelessWidget {
  const FocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat', // Uma fonte similar ao design
        scaffoldBackgroundColor: Colors.white,
        primaryColor: kPrimaryColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/metas': (context) => const MetasScreen(),
        '/correr': (context) => const CorrerScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/redefinir_senha': (context) => const RedefinirSenhaScreen(),
        '/configuracao': (context) => const ConfiguracaoScreen(),
        '/acessibilidade': (context) => const AcessibilidadeScreen(),
        '/postagem': (context) => const PostagemScreen(),
        '/adicionar_meta': (context) => const AdicionarMetaScreen(),
        '/mensagens': (context) => const MensagensScreen(),
      },
    );
  }
}

// --- TELA DE LOGIN ---
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 2),
            const Text('Focus', style: kFocusTitleStyle),
            const Spacer(flex: 1),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                hintText: 'E-mail',
                fillColor: kSecondaryColor,
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Senha',
                fillColor: kSecondaryColor,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/metas');
              },
              child: const Text(
                'Entrar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/redefinir_senha');
              },
              child: const Text(
                'Esqueceu a senha?',
                style: TextStyle(color: kButtonColor),
              ),
            ),
            const Spacer(flex: 2),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cadastrar-se',
                    style: TextStyle(color: kButtonColor),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.accessibility_new, color: kButtonColor),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

// --- TELA DE REDEFINIÇÃO DE SENHA ---
class RedefinirSenhaScreen extends StatelessWidget {
  const RedefinirSenhaScreen({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 2),
            const Text('Focus', style: kFocusTitleStyle),
            const Spacer(flex: 1),
            const SizedBox(height: 20),
            const Text(
              'Redefinição de senha!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kButtonColor,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Informe um e-mail e enviaremos um link para recuperação da sua senha',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'E-mail',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kButtonColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'E-mail',
                fillColor: Colors.white,
              ),
            ),
            const Spacer(flex: 2),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text(
                'Enviar link de recuperação',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Icon(Icons.accessibility_new, color: kButtonColor),
          ],
        ),
      ),
    );
  }
}

// --- TELA DE CADASTRO ---
class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Focus', style: kPageTitleStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildTextField(label: 'Nome:', hint: 'Nome'),
            _buildTextField(label: 'Usuário:', hint: 'Usuário'),
            _buildTextField(label: 'E-mail:', hint: 'E-mail'),
            _buildTextField(label: 'Crie uma senha:', hint: 'Senha', obscureText: true),
            const SizedBox(height: 40),
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
                  Navigator.pushNamed(context, '/metas');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.accessibility_new, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hint, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
          const SizedBox(height: 8),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

// --- TELA DE METAS ---
class MetasScreen extends StatelessWidget {
  const MetasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: kButtonColor),
          onPressed: () {
            Navigator.pushNamed(context, '/configuracao');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: kButtonColor),
            onPressed: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, kPrimaryColor],
            stops: [0.0, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Center(child: Text('METAS', style: kPageTitleStyle)),
              const SizedBox(height: 40),
              _buildMetaItem(context, 'Correr', onTap: () => Navigator.pushNamed(context, '/correr')),
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

  Widget _buildMetaItem(BuildContext context, String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
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
          child: CheckboxListTile(
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
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

// --- TELA ADICIONAR NOVA META (NOVA) ---
class AdicionarMetaScreen extends StatelessWidget {
  const AdicionarMetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Nova Meta', style: kPageTitleStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildTextField(label: 'Título da Meta:', hint: 'Ex: Ler 10 páginas'),
            _buildTextField(label: 'Prazo:', hint: 'Ex: 31/12/2025'),
            _buildTextField(label: 'Categoria:', hint: 'Ex: Saúde, Estudo...'),
            const SizedBox(height: 40),
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
                  
                  Navigator.pop(context);
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
    );
  }

  Widget _buildTextField({required String label, required String hint, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
          const SizedBox(height: 8),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

// --- TELA DE MENSAGENS (NOVA) ---
class MensagensScreen extends StatelessWidget {
  const MensagensScreen({super.key});

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
        title: const Text('Mensagens', style: kPageTitleStyle),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMessageItem(
            'Nome do Contato',
            'Última mensagem...',
            '10:30',
          ),
          _buildMessageItem(
            'Amigo de Corrida',
            'Bora correr hoje?',
            'Ontem',
          ),
          _buildMessageItem(
            'Grupo de Leitura',
            'Alguém terminou o livro?',
            '2 dias atrás',
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(String name, String message, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kButtonColor,
            child: Text(name[0], style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.black45)),
        ],
      ),
    );
  }
}

// --- TELA DE CONFIGURAÇÃO ---
class ConfiguracaoScreen extends StatelessWidget {
  const ConfiguracaoScreen({super.key});

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
              title: 'Notificação e lembretes',
              items: [
                'Alerta para datas importantes',
                'Lembretes para tarefas diárias e semanais',
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              title: 'Configurações de Acesso e Conta',
              items: [
                'Gerenciamento de perfil e informações pessoais',
                'Configurações de Segurança e autenticação',
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              title: 'Controle de privacidade',
              items: [
                'Controle de quem pode ver suas metas e progresso',
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              title: 'Acessibilidade',
              items: ['Acessibilidade'],
              onTapItem: (item) {
                if (item == 'Acessibilidade') {
                  Navigator.pushNamed(context, '/acessibilidade');
                }
              },
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              title: 'Interação Social',
              items: ['Mensagens'],
              onTapItem: (item) {
                if (item == 'Mensagens') {
                  Navigator.pushNamed(context, '/mensagens');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<String> items,
    Function(String)? onTapItem,
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
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: InkWell(
                onTap: () => onTapItem?.call(item),
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

// --- TELA DE ACESSIBILIDADE ---
class AcessibilidadeScreen extends StatelessWidget {
  const AcessibilidadeScreen({super.key});

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
        title: const Text('Acessibilidade', style: kPageTitleStyle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccessibilityItem('Modo de alto contraste'),
            _buildAccessibilityItem('Tamanho da fonte'),
            _buildAccessibilityItem('Tema de Cores'),
            _buildAccessibilityItem('Navegação por teclado'),
            _buildAccessibilityItem('Feedback auditivo'),
            _buildAccessibilityItem('Leitores de tela'),
          ],
        ),
      ),
    );
  }

  Widget _buildAccessibilityItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}

// --- TELA DE POSTAGEM ---
class PostagemScreen extends StatelessWidget {
  const PostagemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Focus',
          style: kPageTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, kPrimaryColor],
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Escreva algo...',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.more_horiz),
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
                    profileIcon: Icons.person_pin,
                  ),
                  const SizedBox(height: 16),
                  _buildPostCard(
                    user: 'Usuário2',
                    text: 'Achei esses livros incríveis !!!',
                    profileIcon: Icons.person_outline,
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

  Widget _buildPostCard({
    required String user,
    required String text,
    required IconData profileIcon,
    bool hasImage = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
                backgroundColor: kSecondaryColor,
                child: Icon(profileIcon, color: kButtonColor),
              ),
              const SizedBox(width: 8),
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
              child: const Center(
                child: Text('Placeholder para Livros/Imagem', textAlign: TextAlign.center),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// --- TELA DE CORRIDA (EDITAR META) ---
class CorrerScreen extends StatelessWidget {
  const CorrerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Correr', style: kPageTitleStyle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: kButtonColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildInfoCard('Horário: 14:30', onTap: () {}),
            const SizedBox(height: 20),
            _buildCalendar(),
            const SizedBox(height: 40),
            _buildObjectiveCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String text, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back_ios, color: Colors.black54, size: 16),
              Text('AGOSTO 2024', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 16),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('DOM', style: TextStyle(color: Colors.red)),
              Text('SEG'), Text('TER'), Text('QUA'), Text('QUI'), Text('SEX'),
              Text('SAB', style: TextStyle(color: Colors.red)),
            ],
          ),
          SizedBox(height: 8),
          // Simulação dos dias do calendário
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(' '), Text('1'), Text('2'), Text('3'), Text('4'), Text('5'), Text('6'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('7'),
              _DayCircle(text: '8', isSelected: true),
              Text('9'), Text('10'), Text('11'), Text('12'), Text('13'),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('14'), Text('15'), Text('16'), Text('17'), Text('18'), Text('19'), Text('20'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildObjectiveCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'OBJETIVO: CORRER 5KM',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kButtonColor,
          ),
        ),
      ),
    );
  }
}

class _DayCircle extends StatelessWidget {
  final String text;
  final bool isSelected;
  const _DayCircle({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: isSelected
          ? BoxDecoration(
              color: kButtonColor,
              shape: BoxShape.circle,
            )
          : null,
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

// --- TELA DE PERFIL ---
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Perfil', style: kPageTitleStyle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: kButtonColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Icon(Icons.person, size: 80, color: kButtonColor),
            ),
            const SizedBox(height: 40),
            _buildTextField(label: 'Usuário:', initialValue: 'usuário_exemplo'),
            const SizedBox(height: 20),
            _buildTextField(label: 'Sobre mim:', hint: 'Escreva um pouco sobre você...', maxLines: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, String? initialValue, String? hint, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
        const SizedBox(height: 8),
        TextField(
          controller: TextEditingController(text: initialValue),
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            fillColor: kSecondaryColor,
          ),
        ),
      ],
    );
  }
}