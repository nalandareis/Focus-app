// lib/models/lembrete.dart

class Lembrete {
  final String id;
  final String titulo;
  final String descricao;
  final DateTime dataHora;
  final bool ativo;

  Lembrete({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.dataHora,
    this.ativo = true,
  });
}