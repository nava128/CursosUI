import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/curso_model.dart';
import '../../repositories/interfaces/curso_repository_interface.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ICursoRepository _repository = Modular.get<ICursoRepository>();

  @observable
  String filter = "";

  @action
  void setFilter(String filter) {
    this.filter = filter;
  }

  Future<List<CursoModel>> findAllCursos() {
    return _repository.findAllCursos(filter);
  }

  void deleteCurso(CursoModel curso) {
    _repository.deleteCurso(curso);
  }
}
