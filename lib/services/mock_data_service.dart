import '../models/meta.dart';
import '../models/usuaria.dart';
import '../models/postagem.dart';
import '../models/lembrete.dart';

// Classe auxiliar para a listagem da Equipe
class MembroEquipe {
  final String nome;
  final String funcao;

  MembroEquipe({required this.nome, required this.funcao});
}

// Classe auxiliar para a listagem de Comentários
class Comentario {
  final Usuaria autor;
  final String texto;
  Comentario({required this.autor, required this.texto});
}

class MockDataService {
  // REMOÇÃO DO CONSTRUTOR CONST para evitar o erro
  MockDataService(); // Erro: Cannot invoke a non-'const' constructor where a const expression is expected.

  // O objeto UsuariaLogada agora é público (SEM o _)
  final Usuaria usuariaLogada = Usuaria(
    id: 'u1',
    nome: 'Nalanda Reis',
    usuario: 'nalandareis',
    email: 'nalanda@focus.com',
    fotoUrl: 'assets/imgs/biografia.jpg',
    descricao: 'Estudante e fã de Flutter!',
  );

  // ===============================================
  // 6 LISTAGENS MOCKADAS
  // ===============================================

  List<Meta> get metasDoUsuario => [
    Meta(
      id: 'm1',
      titulo: 'Correr 5km',
      categoria: 'Saúde',
      prazo: DateTime.now().add(const Duration(days: 30)),
      progresso: 0.8,
    ),
    Meta(
      id: 'm2',
      titulo: 'Ler 3 livros de Flutter',
      categoria: 'Estudo',
      prazo: DateTime.now().add(const Duration(days: 90)),
      progresso: 0.33,
    ),
    Meta(
      id: 'm3',
      titulo: 'Beber 2L de água por dia',
      categoria: 'Saúde',
      prazo: DateTime.now().add(const Duration(days: 7)),
      concluida: true,
    ),
  ];

  // Listagem 2: Lista de postagens para o Feed.
  List<Postagem> get feedDePostagens => [
    Postagem(
      id: 'p1',
      // Note: autor precisa ser um objeto Usuaria. Usamos o objeto público 'usuariaLogada'
      autor: usuariaLogada,
      texto: 'Finalizei mais um módulo do curso! 🚀',
      curtidas: 15,
      comentarios: 3,
    ),
  ];

  // Listagem 4: Lista de notificações ou lembretes (Agora público)
  List<Lembrete> get lembretesAtivos => [
    Lembrete(
        id: 'l1',
        titulo: 'Lembrete Diário: Água!',
        descricao: 'Hora de beber água e registrar na meta.',
        dataHora: DateTime.now()),
    Lembrete(
        id: 'l2',
        titulo: 'Prazo Final de Meta',
        descricao: 'Meta \"Correr 5km\" expira em 3 dias.',
        dataHora: DateTime.now().add(const Duration(days: 3))),
  ];

  // Listagem 5: Lista de membros da equipe.
  List<MembroEquipe> get equipeFocusApp => [
    MembroEquipe(nome: 'Nalanda Reis', funcao: 'Desenvolvedora Frontend'),
    MembroEquipe(nome: 'Camyla Sousa', funcao: 'Desenvolvedora Backend'),
  ];
}