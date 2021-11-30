import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_module.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_store.dart';
import 'package:meu_cronograma/app/repositories/interfaces/atividade_repository_interface.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';
import 'package:mockito/mockito.dart';

class AtividadeMock extends Mock implements IAtividadeRepository {}

class CursoMock extends Mock implements ICursoRepository {}

void main() {
  AtividadeStore atividade = AtividadeStore();

  setUpAll(() {
    initModule(AppModule(), replaceBinds: [
      Bind.instance<ICursoRepository>(CursoMock()),
    ]);
    initModule(AtividadeModule(), replaceBinds: [
      Bind.instance<IAtividadeRepository>(AtividadeMock()),
    ]);
  });

  group('AtividadeStore Test', () {
    test("First Test", () {
      expect(atividade, isInstanceOf<AtividadeStore>());
    });

    test("Get Atividades", () async {
      var atividadeRepository = Modular.get<IAtividadeRepository>();
      when(atividadeRepository.findAllAtividadesByCurso(
              CursoModel(id: 1, descricao: '', nome: '')))
          .thenAnswer((value) async => []);
      var cursoRepository = Modular.get<ICursoRepository>();
      int idCurso = 1;
      double percentConcluido = 100;
      when(cursoRepository.updatePercentConcluido(idCurso, percentConcluido))
          .thenAnswer((value) async => []);

      var atividades = await atividade
          .getAtividades(CursoModel(id: 1, descricao: '', nome: ''));
      int qtdAtividadesBefore = atividades.length;
      expect(qtdAtividadesBefore, equals(0));
      await atividade.saveAtividade(AtividadeModel(idCurso: 1, nome: ''));
      atividades = await atividade
          .getAtividades(CursoModel(id: 1, descricao: '', nome: ''));
      int qtdAtividades = atividades.length;
      expect(qtdAtividades, equals(1));
    });
  });
}
