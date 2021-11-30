import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/atividade_repository.dart';
import 'atividade_page.dart';
import 'atividade_store.dart';

class AtividadeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AtividadeRepository()),
    Bind.lazySingleton((i) => AtividadeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AtividadePage(curso: args.data)),
  ];
}
