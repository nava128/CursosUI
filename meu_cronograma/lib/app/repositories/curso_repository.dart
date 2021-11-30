import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'constants.dart';
import 'interfaces/curso_repository_interface.dart';

class CursoRepository implements ICursoRepository {
  Future<Database> getDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, Constants.databaseName); //import path
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE IF NOT EXISTS ${Constants.cursoTable} '
          ' (id INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' nome TEXT, '
          ' descricao TEXT,'
          ' link TEXT,'
          ' imagePath TEXT'
          ')');
      await db.execute('CREATE TABLE IF NOT EXISTS ${Constants.atividadeTable} '
          '(id INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' nome TEXT,'
          ' feito TEXT,'
          ' idCurso INTEGER'
          ')');
    });
  }

  List<CursoModel> cursos = [];

  @override
  void save(CursoModel curso) async {
    try {
      final db = await getDatabase();
      if (cursos.contains(curso)) {
        db.update(Constants.cursoTable, curso.toMap(),
            where: 'id = ?', whereArgs: [curso.id]);
        cursos.remove(curso);
      } else {
        int id = await db.insert(Constants.cursoTable, curso.toMap());
        curso.id = id;
      }
      cursos.add(curso);
    } catch (e) {
      //print(e);
    }
  }

  @override
  Future<List<CursoModel>> findAllCursos(String filter) async {
    if (cursos.isEmpty) {
      cursos = await getCursosDb();
    }
    List<CursoModel> cursosFiltrados = _filterList(cursos, filter);
    cursosFiltrados.sort((a, b) => a.id!.compareTo(b.id!));
    return cursosFiltrados;
  }

  List<CursoModel> _filterList(List<CursoModel> cursos, String? filter) {
    if (filter != null) {
      return cursos.where((element) => element.nome.contains(filter)).toList();
    } else {
      return cursos;
    }
  }

  @override
  void deleteCurso(CursoModel curso) async {
    cursos.remove(curso);
    final db = await getDatabase();
    db.delete(Constants.cursoTable, where: 'id = ?', whereArgs: [curso.id]);
  }

  Future<List<CursoModel>> getCursosDb() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> list = await db.rawQuery(
        "SELECT curso.*, atividadeFeito.atividadesFeitas as atividadesFeitas, atividade.atividades as todasAtividades"
        " FROM ${Constants.cursoTable} curso "
        " LEFT JOIN (SELECT atv.idCurso, count(atv.id) as atividades FROM ${Constants.atividadeTable} atv "
        " GROUP BY atv.idCurso"
        " )"
        " atividade on curso.id = atividade.idCurso "
        " LEFT JOIN (SELECT atv.idCurso, count(atv.id) as atividadesFeitas FROM ${Constants.atividadeTable} atv "
        " WHERE atv.feito = 'true' "
        " GROUP BY atv.idCurso"
        " )"
        " atividadeFeito on curso.id = atividadeFeito.idCurso ");
    return list.map((e) => CursoModel.fromDb(e)).toList();
  }

  @override
  void updatePercentConcluido(int idCurso, double percentConcluido) {
    var curso = cursos.where((element) => element.id == idCurso).first;
    curso.setPercentConcluido(percentConcluido);
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
  }
}
