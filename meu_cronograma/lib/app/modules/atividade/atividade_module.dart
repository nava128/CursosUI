import 'package:meu_cronograma/app/modules/atividade/atividade_Page.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AtividadeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AtividadeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AtividadePage()),
  ];
}
