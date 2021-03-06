import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/curso/curso_store.dart';
import 'package:flutter/material.dart';

import 'curso_form.dart';

class CursoPage extends StatefulWidget {
  final CursoModel? curso;
  const CursoPage({Key? key, this.curso}) : super(key: key);
  @override
  CursoPageState createState() => CursoPageState();
}

class CursoPageState extends State<CursoPage> {
  final CursoStore store = Modular.get();
  CursoModel? curso;
  // final CursoModel curso =
  //     CursoModel(id: 0, nome: "nome", descricao: "descricao");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Observer(
              builder: (_) => curso == null
                  ? const Text('Sem cursos cadastrados')
                  : Text(curso!.nome))),
      body: SingleChildScrollView(
          child: CursoForm(curso: curso ?? CursoModel.empty())),
    );
  }
}
