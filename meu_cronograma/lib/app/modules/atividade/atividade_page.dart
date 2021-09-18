import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_store.dart';
import 'package:flutter/material.dart';
import 'package:meu_cronograma/app/modules/atividade/progress_circle.dart';
import 'package:meu_cronograma/app/shared/widgets/background_box_decoration.dart';
import 'package:meu_cronograma/app/shared/widgets/logo_widget.dart';

import 'dialog_atividade.dart';
import 'listagem_atividade.dart';

class AtividadePage extends StatefulWidget {
  final CursoModel curso;
  const AtividadePage({Key? key, required this.curso}) : super(key: key);
  @override
  AtividadePageState createState() => AtividadePageState();
}

class AtividadePageState extends State<AtividadePage> {
  final AtividadeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LogoWidget(
          image: CircleAvatar(child: widget.curso.logoImage),
          title: widget.curso.nome,
        ),
      ),
      body: Container(
        decoration: BackgroundBoxDecoration.getBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Observer(
                  builder: (_) =>
                      ProgressCircle(percentConcluido: store.percentConcluido)),
              Expanded(child: ListagemAtividade(curso: widget.curso)),
              MaterialButton(
                padding: const EdgeInsets.all(10.0),
                color: Colors.black54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => DialogAtividade(
                        atividade:
                            AtividadeModel.empty(idCurso: widget.curso.id))),
                child: const Text(
                  'Adicionar nova atividade',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              // ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
