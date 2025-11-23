// lib/models/postagem.dart

import 'usuaria.dart';

class Postagem {
  final String id;
  final Usuaria autor;
  final String texto;
  final String? imageUrl;
  final int curtidas;
  final int comentarios;

  Postagem({
    required this.id,
    required this.autor,
    required this.texto,
    this.imageUrl,
    this.curtidas = 0,
    this.comentarios = 0,
  });
}