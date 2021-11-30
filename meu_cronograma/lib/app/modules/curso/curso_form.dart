import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';

import '../../app_widget.dart';
import '../../domain/curso_model.dart';

class CursoForm extends StatefulWidget {
  final CursoModel curso;

  // ignore: prefer_const_constructors_in_immutables
  CursoForm({Key? key, required this.curso}) : super(key: key);

  @override
  _CursoFormState createState() => _CursoFormState();
}

class _CursoFormState extends State<CursoForm> {
  final ICursoRepository _cursoRepository = Modular.get<ICursoRepository>();

  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker(); //importa package

  @override
  void initState() {
    // Isso faz com que desapareça o erro de inicialização da variável curso
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          alignment: WrapAlignment.end,
          spacing: 20,
          runSpacing: 10,
          children: <Widget>[
            Observer(
              builder: (_) => Visibility(
                  visible: true,
                  child: GestureDetector(
                      onTap: () => updateImage(),
                      child: Center(
                        // ignore: sized_box_for_whitespace
                        child: Container(
                            height: 200,
                            width: 200,
                            child: widget.curso.logoImage),
                      ))),
            ),
            Observer(
                builder: (_) => TextFormField(
                      validator: textValidator(),
                      onChanged: updateNome,
                      initialValue: widget.curso.nome,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Nome"),
                      maxLength: 100,
                    )),
            Observer(
                builder: (_) => TextFormField(
                      onChanged: updateLink,
                      initialValue: widget.curso.link,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Link Curso"),
                      maxLength: 200,
                    )),
            Observer(
                builder: (_) => TextFormField(
                      validator: textValidator(),
                      onChanged: updateDescricao,
                      initialValue: widget.curso.descricao,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Descrição"),
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      maxLength: 1000,
                    )),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                    color: AppWidget.color[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //print(widget.curso);

                        _cursoRepository.save(widget.curso);

                        Navigator.of(context)
                            .pushNamedAndRemoveUntil("/", (_) => false);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const Icon(Icons.save),
                          const SizedBox(width: 10),
                          const Text(
                            'Salvar',
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      widget.curso.imagePath = pickedFile.path;
      widget.curso.setLogoImage(Image.file(File(pickedFile.path)));
    }
  }

  void updateNome(nome) {
    widget.curso.setNome(nome);
  }

  void updateLink(link) {
    widget.curso.setLink(link);
  }

  void updateDescricao(descricao) {
    widget.curso.setDescricao(descricao);
  }

  FieldValidator textValidator() {
    return MultiValidator([
      RequiredValidator(errorText: 'campo obrigatório'),
      MinLengthValidator(4, errorText: 'tamanho mínimo de 4 caracteres'),
    ]);
  }
}
