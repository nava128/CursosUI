import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/curso/curso_store.dart';
import 'package:flutter/material.dart';

import 'curso_form.dart';

class CursoPage extends StatefulWidget {
  final CursoModel curso;
  const CursoPage({Key? key, required this.curso}) : super(key: key);

  @override
  CursoPageState createState() => CursoPageState();
}

class CursoPageState extends State<CursoPage> {
  final CursoStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Observer(builder: (_) => Text(widget.curso.nome))),
      body: SingleChildScrollView(child: CursoForm(curso: widget.curso)),
    );
  }
}
