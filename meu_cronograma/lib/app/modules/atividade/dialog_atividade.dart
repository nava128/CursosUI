import 'package:flutter/material.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';

import 'atividade_form.dart';

class DialogAtividade extends StatelessWidget {
  final AtividadeModel atividade;

  const DialogAtividade({Key? key, required this.atividade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      // ignore: sized_box_for_whitespace
      child: Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  atividade.nome,
                  style: const TextStyle(fontSize: 25, color: Colors.red),
                ),
              ),
              AtividadeForm(
                atividade: atividade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
