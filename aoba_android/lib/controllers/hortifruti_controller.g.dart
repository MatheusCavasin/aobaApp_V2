// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hortifruti_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HortifrutiController on _HortifrutiControllerBase, Store {
  final _$categoriasAtom = Atom(name: '_HortifrutiControllerBase.categorias');

  @override
  List<List<Categoria>> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(List<List<Categoria>> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  final _$_HortifrutiControllerBaseActionController =
      ActionController(name: '_HortifrutiControllerBase');

  @override
  dynamic obterCategorias() {
    final _$actionInfo = _$_HortifrutiControllerBaseActionController
        .startAction(name: '_HortifrutiControllerBase.obterCategorias');
    try {
      return super.obterCategorias();
    } finally {
      _$_HortifrutiControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categorias: ${categorias}
    ''';
  }
}
