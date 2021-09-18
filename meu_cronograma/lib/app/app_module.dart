import 'package:meu_cronograma/app/repositories/atividade_repository.dart';
import 'package:meu_cronograma/app/repositories/curso_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/atividade/atividade_module.dart';
import 'modules/curso/curso_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  static const String newCurso = "/curso";
  static const String atividades = "/atividades";

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AtividadeRepository()),
    Bind.lazySingleton((i) => CursoRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(newCurso, module: CursoModule()),
    ModuleRoute(atividades, module: AtividadeModule()),
  ];
}
