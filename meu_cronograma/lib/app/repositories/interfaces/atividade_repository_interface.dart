import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/atividade_model.dart';
import '../../domain/curso_model.dart';

abstract class IAtividadeRepository implements Disposable {
  Future<int> saveAtividade(AtividadeModel atividade);

  Future<List<AtividadeModel>> findAllAtividadesByCurso(CursoModel curso);

  void deleteAtividade(AtividadeModel atividade);
}
