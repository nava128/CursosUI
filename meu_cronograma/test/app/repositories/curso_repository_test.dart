import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/repositories/curso_repository.dart';
 
void main() {
  late CursoRepository repository;

  setUpAll(() {
    repository = CursoRepository();
  });
}