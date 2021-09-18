// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividade_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtividadeStore on _AtividadeStoreBase, Store {
  final _$_atividadesAtom = Atom(name: '_AtividadeStoreBase._atividades');

  @override
  List<AtividadeModel> get _atividades {
    _$_atividadesAtom.reportRead();
    return super._atividades;
  }

  @override
  set _atividades(List<AtividadeModel> value) {
    _$_atividadesAtom.reportWrite(value, super._atividades, () {
      super._atividades = value;
    });
  }

  final _$percentConcluidoAtom =
      Atom(name: '_AtividadeStoreBase.percentConcluido');

  @override
  double get percentConcluido {
    _$percentConcluidoAtom.reportRead();
    return super.percentConcluido;
  }

  @override
  set percentConcluido(double value) {
    _$percentConcluidoAtom.reportWrite(value, super.percentConcluido, () {
      super.percentConcluido = value;
    });
  }

  final _$setPercentConcluidoAsyncAction =
      AsyncAction('_AtividadeStoreBase.setPercentConcluido');

  @override
  Future setPercentConcluido(double percentConcluido) {
    return _$setPercentConcluidoAsyncAction
        .run(() => super.setPercentConcluido(percentConcluido));
  }

  final _$saveAtividadeAsyncAction =
      AsyncAction('_AtividadeStoreBase.saveAtividade');

  @override
  Future saveAtividade(AtividadeModel atividadeModel) {
    return _$saveAtividadeAsyncAction
        .run(() => super.saveAtividade(atividadeModel));
  }

  final _$_AtividadeStoreBaseActionController =
      ActionController(name: '_AtividadeStoreBase');

  @override
  dynamic deleteAtividade(AtividadeModel atividade) {
    final _$actionInfo = _$_AtividadeStoreBaseActionController.startAction(
        name: '_AtividadeStoreBase.deleteAtividade');
    try {
      return super.deleteAtividade(atividade);
    } finally {
      _$_AtividadeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
percentConcluido: ${percentConcluido}
    ''';
  }
}
