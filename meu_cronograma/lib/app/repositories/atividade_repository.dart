import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/atividade_model.dart';
import '../domain/curso_model.dart';
import 'interfaces/atividade_repository_interface.dart';
import 'constants.dart';

class AtividadeRepository implements IAtividadeRepository {
  Future<Database> getDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, Constants.databaseName);
    return openDatabase(path, version: 1);
  }

  @override
  void deleteAtividade(AtividadeModel atividade) async {
    final db = await getDatabase();
    db.delete(Constants.atividadeTable,
        where: 'id = ?', whereArgs: [atividade.id]);
  }

  @override
  Future<int> saveAtividade(AtividadeModel atividade) async {
    final db = await getDatabase();
    int id;
    var atividades = await getAtividadesDb(atividade.idCurso);
    if (atividades.contains(atividade)) {
      db.update(Constants.atividadeTable, atividade.toMap(),
          where: 'id = ?', whereArgs: [atividade.id]);
      id = atividade.id!;
    } else {
      id = await db.insert(Constants.atividadeTable, atividade.toMap());
    }
    return id;
  }

  @override
  Future<List<AtividadeModel>> findAllAtividadesByCurso(
      CursoModel curso) async {
    return await getAtividadesDb(curso.id!);
  }

  Future<List<AtividadeModel>> getAtividadesDb(int idCurso) async {
    final db = await getDatabase();
    List<Map<String, dynamic>> list = await db.rawQuery(
        "SELECT * FROM ${Constants.atividadeTable} WHERE idCurso = ?",
        [idCurso]);
    return list.map((e) => AtividadeModel.fromDb(e)).toList();
  }

  @override
  void dispose() {}
}
