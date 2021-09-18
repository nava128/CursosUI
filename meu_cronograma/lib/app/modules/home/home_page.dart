// ignore_for_file: unnecessary_new, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../../shared/widgets/background_box_decoration.dart';
import '../../shared/widgets/logo_widget.dart';
import 'home_store.dart';
import 'listagem_curso.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackgroundBoxDecoration.getBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SafeArea(child: LogoWidget()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildSearchFilter(),
              ),
              const Expanded(child: ListagemCurso()),
              MaterialButton(
                padding: const EdgeInsets.all(10.0),
                color: Colors.black54,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () =>
                    Navigator.pushNamed(context, AppModule.newCurso),
                child: const Text(
                  'Adicionar novo curso',
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

  Widget _buildSearchFilter() {
    return TextField(
      style: const TextStyle(color: Colors.white, fontSize: 17.0),
      decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Pesquise aqui'),
      onChanged: (filter) => _updateCursosList(filter),
    );
  }

  _updateCursosList(String filter) {
    controller.setFilter(filter);
  }
}
