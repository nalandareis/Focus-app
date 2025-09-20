import 'package:flutter/material.dart';

void main() {
  runApp(const FocusApp());
}

class FocusApp extends StatelessWidget {
  const FocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FOCUS',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.transparent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.blue[400],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

/// Widget base para aplicar fundo em degrade em todas telas
class GradientScaffold extends StatelessWidget {
  final Widget child;
  const GradientScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF74ABE2), Color(0xFF5586E2)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(child: child),
      ),
    );
  }
}

/// ---------------- LOGIN ----------------
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("FOCUS",
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2)),
            const SizedBox(height: 40),
            TextFormField(
              decoration: _input("E-mail"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: _input("Senha"),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const GoalsScreen()),
                );
              },
              child: const Text("Entrar"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Esqueceu a senha?",
                  style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterScreen()),
                );
              },
              child: const Text("Cadastrar-se",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- CADASTRO ----------------
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("FOCUS",
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 40),
            TextFormField(decoration: _input("Nome")),
            const SizedBox(height: 16),
            TextFormField(decoration: _input("Usuário")),
            const SizedBox(height: 16),
            TextFormField(decoration: _input("E-mail")),
            const SizedBox(height: 16),
            TextFormField(decoration: _input("Crie uma senha"), obscureText: true),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- METAS ----------------
class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  final List<String> goals = const ["Correr", "Ler", "Beber 2L água"];

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.menu, color: Colors.white, size: 32),
                Text("METAS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (val) {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          activeColor: Colors.blue,
                        ),
                        Text(goals[i],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500))
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Adicionar +"),
            ),
            const SizedBox(height: 10),
            const Icon(Icons.alternate_email, size: 28, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

/// ---------------- PERFIL ----------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Perfil", style: TextStyle(fontSize: 28, color: Colors.white)),
            SizedBox(height: 30),
            _info("Nome", "João Silva"),
            _info("Usuário", "joaosilva"),
            _info("E-mail", "joao@email.com"),
          ],
        ),
      ),
    );
  }
}

/// ---------------- POSTAGENS ----------------
class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              decoration: _input("Escreva uma postagem"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Publicar"),
            ),
            const SizedBox(height: 30),
            const Text("📌 Postagens recentes",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 10),
            _post("João", "Minha primeira meta concluída! 💪"),
            _post("Maria", "Fiquei 1 semana sem falhar 🙌"),
          ],
        ),
      ),
    );
  }
}

/// ---------------- CONFIGURAÇÕES ----------------
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Acessibilidade",
                style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AccessibilityScreen()),
            ),
          ),
          ListTile(
            title:
                const Text("Sobre", style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------- ACESSIBILIDADE ----------------
class AccessibilityScreen extends StatelessWidget {
  const AccessibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: const Center(
        child: Text("Opções de acessibilidade aqui 🔊",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}

/// ---------------- SOBRE ----------------
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: const Center(
        child: Text("FOCUS App - Projeto Flutter 💙",
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}

/// ---------------- HELPERS ----------------
InputDecoration _input(String label) => InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none),
    );

class _info extends StatelessWidget {
  final String title;
  final String value;
  const _info(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text("$title: $value",
          style: const TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}

class _post extends StatelessWidget {
  final String user;
  final String text;
  const _post(this.user, this.text);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
          backgroundColor: Colors.white, child: Icon(Icons.person)),
      title: Text("$user: $text",
          style: const TextStyle(color: Colors.black, fontSize: 16)),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.all(12),
    );
  }
}
