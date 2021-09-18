import 'package:meu_cronograma/app/modules/curso/curso_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'curso_page.dart';

class CursoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CursoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => CursoPage(curso: args.data)),
  ];
}
