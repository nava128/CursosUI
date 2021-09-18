import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_store.dart';
import 'package:flutter/material.dart';

class AtividadePage extends StatefulWidget {
  final String title;
  const AtividadePage({Key? key, this.title = 'AtividadePage'})
      : super(key: key);
  @override
  AtividadePageState createState() => AtividadePageState();
}

class AtividadePageState extends State<AtividadePage> {
  final AtividadeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
