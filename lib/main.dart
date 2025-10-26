import 'package:flutter/material.dart';
import 'dart:async'; // Necessário para o Timer do SplashScreen

// ----------------------------------------------------
// 1. CONSTANTES (Estilos e Cores) - DEFINIDAS PRIMEIRO
// ----------------------------------------------------
const Color kPrimaryColor = Color(0xFFD9E8F8);
const Color kSecondaryColor = Color(0xFFE9EEF5);
const Color kButtonColor = Color(0xFF5A9DEE);

const TextStyle kFocusTitleStyle = TextStyle(
  fontSize: 48,
  fontWeight: FontWeight.bold,
  color: kButtonColor,
  fontFamily: 'Roboto',
  shadows: [
    Shadow(blurRadius: 10.0, color: Colors.black26, offset: Offset(4, 4)),
  ],
);

const TextStyle kPageTitleStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: kButtonColor,
);

// ----------------------------------------------------
// 2. FUNÇÃO MAIN E CLASSE PRINCIPAL DO APP (UNIFICADAS)
// ----------------------------------------------------

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
        fontFamily: 'Roboto', // Uma fonte similar ao design
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
        useMaterial3: true,
      ),
      // O aplicativo AGORA começa no Splash Screen
      home: const SplashScreen(),

      // ROTAS VÃO DENTRO DO SPLASH SCREEN APÓS O LOGIN (NÃO AQUI)
      // Se quiser usar rotas após o Login, você deve chamá-las no Navigator.pushNamed.
      // Vou deixar a rota principal comentada para evitar conflito com 'home: SplashScreen()'
      /*
      routes: {
        '/login': (context) => const LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/metas': (context) => const MetasScreen(),
        // ... (outras rotas)
      },
      */
    );
  }
}

// ----------------------------------------------------
// 3. TELA DE SPLASH SCREEN (CORRIGIDA)
// ----------------------------------------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Configura o timer para ir para a tela de Login após 3 segundos
    Timer(const Duration(seconds: 3), () {
      // Navega para a tela de Login
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo Azul Claro, igual ao fundo da logo
      backgroundColor: const Color(0xFF8AB9EF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ADICIONANDO A LOGO RENOMEADA
            Image.asset(
              'assets/imgs/logo.png', // CAMINHO CORRETO!
              width: 250,
            ),

            const SizedBox(height: 40),

            // Indicador de Carregamento
            CircularProgressIndicator(color: kButtonColor),
          ],
        ),
      ),
    );
  }
}
// ----------------------------------------------------
// 4. TODAS AS SUAS OUTRAS TELAS (Continuam aqui embaixo)
// ----------------------------------------------------

// --- TELA DE LOGIN (ATUALIZADA com Botão Equipe) ---
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Função auxiliar para criar os campos de texto estilizados
  InputDecoration _customInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: kSecondaryColor,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: kButtonColor, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8AB9EF), // Fundo Azul Médio
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 2),
            // Logo
            Image.asset('assets/imgs/logo.png', height: 80),
            const Spacer(flex: 1),
            const SizedBox(height: 20),

            // Campo E-MAIL
            TextField(
              decoration: _customInputDecoration('E-mail'),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16),

            // Campo SENHA
            TextField(
              decoration: _customInputDecoration('Senha'),
              obscureText: true,
            ),

            const SizedBox(height: 24),

            // Botão ENTRAR
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MetasScreen()),
                );
              },
              child: const Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Botão Esqueceu a senha?
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RedefinirSenhaScreen(),
                  ),
                );
              },
              child: const Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  color: Color(0xFF3C7ECD),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const Spacer(
              flex: 1,
            ), // Reduzi o espaçador aqui para caber o novo botão
            // NOVO BOTÃO: CONHEÇA A EQUIPE
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EquipeScreen()),
                );
              },
              child: const Text(
                'Conheça a Equipe',
                style: TextStyle(
                  color: Color(0xFF3C7ECD),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Spacer(flex: 1), // Espaçador
            // Link Cadastrar-se
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroScreen(),
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cadastrar-se',
                    style: TextStyle(
                      color: Color(0xFF3C7ECD),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.accessibility_new, color: kButtonColor),
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

// O restante das classes (RedefinirSenhaScreen, CadastroScreen, MetasScreen,
// PostagemScreen, etc.) deve ser colado AQUI, como estava no seu código.
// Eu vou colocar a parte final do código que você me enviou para completar:

// ... (Resto do código da RedefinirSenhaScreen, CadastroScreen, MetasScreen,
// AdicionarMetaScreen, MensagensScreen, ConfiguracaoScreen,
// AcessibilidadeScreen, PostagemScreen e CorrerScreen) ...
// Certifique-se de que a função _buildPostCard() e _buildTextField() estão incluídas.

// IMPORTANTE: Tive que corrigir os Navigator.pushNamed para Navigator.push
// e adicionar o builder (MaterialPageRoute) porque não estamos mais usando
// a propriedade 'routes' do MaterialApp.

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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
        // --- MUDANÇA AQUI: Substituindo o Text pela Imagem ---
        title: Image.asset(
          'assets/imgs/logo_cadastro.png', // O caminho da sua logo
          height: 60, // Ajuste o tamanho para caber bem na AppBar
          //AJUSTAR COM NALANDA
        ),
        // Removido o 'centerTitle: true' se a logo for ficar à esquerda,
        // mas vamos manter para centralizar a imagem:
        centerTitle: true,
        // -----------------------------------------------------
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
            _buildTextField(
              label: 'Crie uma senha:',
              hint: 'Senha',
              obscureText: true,
            ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MetasScreen(),
                    ),
                  );
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

  Widget _buildTextField({
    required String label,
    required String hint,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
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
      // 1. Torna o corpo da tela visível por trás da AppBar
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        // 2. Remove a cor de fundo da AppBar
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: kButtonColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConfiguracaoScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            // --- AQUI É ONDE A MUDANÇA OCORRE ---
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PerfilScreen()),
              );
            },
            icon: CircleAvatar(
              radius: 18, // Ajuste o raio conforme necessário para caber na AppBar
              backgroundColor: Colors.white, // Fundo do avatar, pode ser transparente ou uma cor
              child: ClipOval(
                child: Image.asset(
                  'assets/imgs/biografia.jpg', // **SEU CAMINHO DA IMAGEM DE PERFIL AQUI**
                  fit: BoxFit.cover,
                  width: 36, // Deve ser o dobro do raio
                  height: 36, // Deve ser o dobro do raio
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        // Configuração da Imagem de Fundo
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/index.png'),
            fit: BoxFit.cover, // Preenche todo o espaço
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Adicione um Padding ou SizedBox maior aqui para evitar que o texto fique
              // escondido atrás da AppBar transparente.
              const SizedBox(height: 100),

              const Center(child: Text('METAS', style: kPageTitleStyle)),
              const SizedBox(height: 40),

              _buildMetaItem(
                context,
                'Correr',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CorrerScreen()),
                ),
              ),
              _buildMetaItem(context, 'Ler'),
              _buildMetaItem(context, 'Beber 2L água'),

              const Spacer(),

              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdicionarMetaScreen(),
                          ),
                        );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostagemScreen(),
                      ),
                    );
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
            // Camada branca semi-transparente para garantir a legibilidade do texto
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

// --- TELA ADICIONAR NOVA META ---
class AdicionarMetaScreen extends StatelessWidget {
  const AdicionarMetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Torna o corpo da tela visível por trás da AppBar
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        // 2. Remove a cor de fundo da AppBar
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
        // Certifique-se de que o estilo do título (kPageTitleStyle) tem uma cor que se destaca no fundo
        title: const Text('Nova Meta', style: kPageTitleStyle),
        centerTitle: true,
      ),
      body: Container(
        // 3. Adiciona a Imagem de Fundo
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/index.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          // Adiciona padding na parte superior para que o conteúdo não fique sob a AppBar
          padding: const EdgeInsets.fromLTRB(24.0, 100.0, 24.0, 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Conteúdo da tela
              _buildTextField(
                label: 'Título da Meta:',
                hint: 'Ex: Ler 10 páginas',
              ),
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
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black, // Cor do label forte para o fundo
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              // Mantenha o preenchimento, mas adicione opacidade para legibilidade
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: kButtonColor, width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- TELA DE MENSAGENS ---
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
          _buildMessageItem('Nome do Contato', 'Última mensagem...', '10:30'),
          _buildMessageItem('Amigo de Corrida', 'Bora correr hoje?', 'Ontem'),
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
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: Colors.black45),
          ),
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
              context, // Passando o context para as chamadas de navegação
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
              items: ['Acessibilidade'],
              onTapItem: (item) {
                if (item == 'Acessibilidade') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AcessibilidadeScreen(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 24),
            _buildSettingsSection(
              context,
              title: 'Interação Social',
              items: ['Mensagens'],
              onTapItem: (item) {
                if (item == 'Mensagens') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MensagensScreen(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context, {
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
        ...items.map(
          (item) => Padding(
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
          ),
        ),
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
      // 1. Torna o corpo da tela visível por trás da AppBar
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        // 2. Remove a cor de fundo da AppBar
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kButtonColor),
          onPressed: () => Navigator.pop(context),
        ),
        // Certifique-se de que o kPageTitleStyle usa uma cor legível (ex: branco ou preto)
        title: const Text('Focus', style: kPageTitleStyle),
        centerTitle: true,
      ),
      body: Container(
        // 3. Adiciona a Imagem de Fundo
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
                  // 4. Cor semi-transparente para o campo de texto
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Escreva algo...',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.more_horiz, color: kButtonColor),
                  ),
                ),
              ),
            ),

            // --- LISTA DE POSTAGENS ---
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  // POST 1: CLARAMARTINS
                  _buildPostCard(
                    user: 'claramartins',
                    text: 'Hoje corri 5Km !!!',
                    profileAsset: 'assets/imgs/mascara.jpg',
                  ),
                  const SizedBox(height: 16),

                  // POST 2: USUÁRIO 2
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

      // --- BARRA INFERIOR ---
      // Mantendo o estilo original aqui, mas você pode querer torná-lo semi-transparente
      bottomNavigationBar: Container(
        color: kPrimaryColor.withOpacity(0.9), // Exemplo de opacidade na barra inferior
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

  // Função _buildPostCard (Incluída para completar a lógica da tela)
  Widget _buildPostCard({
    required String user,
    required String text,
    required String profileAsset,
    bool hasImage = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      // 5. Cor semi-transparente para os cards de postagem
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(profileAsset),
              ),
              const SizedBox(width: 10),
              Text(
                user,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text('1h atrás', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          Text(text),
          if (hasImage) ...[
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // Usando um placeholder, você pode trocar por uma imagem real de postagem
              child: Image.asset(
                'assets/imgs/index.png',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
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
}

  // FUNÇÃO AUXILIAR CORRIGIDA: AGORA SUPORTA IMAGENS DE ASSET
  Widget _buildPostCard({
    required String user,
    required String text,
    IconData profileIcon = Icons.person, // O ícone padrão
    String? profileAsset, // <--- NOVO: Caminho da imagem de asset (opcional)
    bool hasImage = false,
  }) {
    // Definindo o avatar baseado se um asset foi fornecido
    Widget userAvatar;
    if (profileAsset != null) {
      // Se tiver asset, usa a imagem
      userAvatar = CircleAvatar(
        backgroundColor: kSecondaryColor,
        child: ClipOval(
          child: Image.asset(
            profileAsset, // Usa o asset com o caminho fornecido
            fit: BoxFit.cover,
            width: 40,
            height: 40,
          ),
        ),
      );
    } else {
      // Se não tiver asset, usa o ícone padrão (como era antes)
      userAvatar = CircleAvatar(
        backgroundColor: kSecondaryColor,
        child: Icon(profileIcon, color: kButtonColor),
      );
    }

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
              userAvatar, // <--- WIDGET DO AVATAR AGORA É VARIÁVEL
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
                child: Text(
                  'Placeholder para Livros/Imagem',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ],
      ),
    );
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
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: kButtonColor),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calendário de Atividades',
            style: TextStyle(fontWeight: FontWeight.bold, color: kButtonColor),
          ),
          const SizedBox(height: 10),
          // Placeholder simples para calendário
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDayCircle('Seg', true),
              _buildDayCircle('Ter', false),
              _buildDayCircle('Qua', true),
              _buildDayCircle('Qui', false),
              _buildDayCircle('Sex', true),
              _buildDayCircle('Sáb', false),
              _buildDayCircle('Dom', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayCircle(String day, bool completed) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: completed ? kButtonColor : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: kButtonColor),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: completed ? Colors.white : kButtonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildObjectiveCard() {
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
          const Text(
            'Objetivo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kButtonColor,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('5Km/semana', style: TextStyle(fontSize: 16)),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Completar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 0.7, // 70% completo
            backgroundColor: kSecondaryColor,
            valueColor: AlwaysStoppedAnimation<Color>(kButtonColor),
            minHeight: 10,
          ),
          const SizedBox(height: 5),
          const Text(
            '3.5Km de 5Km',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

// --- TELA DE PERFIL (VERSÃO EDITÁVEL E COMPLETA) ---
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
        // 3. Adiciona a Imagem de Fundo
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgs/index.png'), // Certifique-se de que o nome está correto
            fit: BoxFit.cover, // Preenche todo o espaço
          ),
        ),
        child: SingleChildScrollView(
          // Adiciona padding na parte superior para que o conteúdo não fique sob a AppBar transparente
          padding: const EdgeInsets.fromLTRB(24.0, 100.0, 24.0, 24.0),
          child: Column(
            children: [
              // Avatar
              CircleAvatar(
                radius: 60,
                backgroundColor: kPrimaryColor,
                child: ClipOval(
                  child: Image.asset(
                    'assets/imgs/biografia.jpg',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
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
                    // Aqui você faria algo para salvar o valor digitado
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
                      // Aqui você faria algo para salvar o valor digitado
                    }
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
    );
  }
}

// ----------------------------------------------------
// NOVO! TELA CONHEÇA A EQUIPE
// ----------------------------------------------------

// Widget auxiliar para construir o card de cada membro da equipe
Widget _buildTeamMemberCard({
  required String name,
  required String role,
  required String contribution,
  required String photoAsset, // NOVO: Caminho do asset da foto
}) {
  const TextStyle nameStyle = TextStyle(
    color: Color.fromARGB(255, 18, 75, 144),
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
        // SUBSTITUIÇÃO AQUI: De Icon para Image.asset
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.asset(
              photoAsset, // Usa o caminho passado
              fit: BoxFit.cover,
              width: 70, // Duas vezes o radius (35*2)
              height: 70,
            ),
          ),
        ),
        const SizedBox(width: 15),

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

class EquipeScreen extends StatelessWidget {
  const EquipeScreen({super.key});

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
          

            // Card da Camyla (NOVO CHAMADO COM O CAMINHO DA FOTO)
            _buildTeamMemberCard(
              name: 'CAMYLA ANDRADE',
              role: 'Co-Fundadora & Desenvolvedora',
              contribution:
                  'Desenvolvimento do APP, Experiência do Usuário (UX) e Design de Interfaces (UI).',
              photoAsset: 'assets/imgs/CAMYLA.jpg', // VERIFIQUE O NOME AQUI!
            ),

            // Card da Nalanda (NOVO CHAMADO COM O CAMINHO DA FOTO)
            _buildTeamMemberCard(
              name: 'NALANDA REIS',
              role: 'Co-Fundadora & Desenvolvedora',
              contribution:
                  'Desenvolvimento do APP, e Design.',
              photoAsset: 'assets/imgs/NALANDA.jpg', // VERIFIQUE O NOME AQUI!
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
