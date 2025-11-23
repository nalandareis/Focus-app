// lib/models/usuaria.dart

class Usuaria {
  final String id;
  final String nome;
  final String usuario;
  final String email;
  final String fotoUrl;
  final String descricao;

  Usuaria({
    required this.id,
    required this.nome,
    required this.usuario,
    required this.email,
    required this.fotoUrl,
    required this.descricao,
  });
}