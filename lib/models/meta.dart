// lib/models/meta.dart

class Meta {
  final String id;
  final String titulo;
  final String categoria;
  final DateTime prazo;
  final double progresso; // Ex: 0.0 a 1.0 (0% a 100%)
  final bool concluida;

  Meta({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.prazo,
    this.progresso = 0.0,
    this.concluida = false,
  });
}