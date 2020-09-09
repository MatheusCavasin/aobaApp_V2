// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_da_categoria_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutosDaCategoria on _ProdutosDaCategoriaBase, Store {
  final _$categoriaAtom = Atom(name: '_ProdutosDaCategoriaBase.categoria');

  @override
  List<Produto> get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(List<Produto> value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  final _$_ProdutosDaCategoriaBaseActionController =
      ActionController(name: '_ProdutosDaCategoriaBase');

  @override
  dynamic pesquisarPorProdutosDaCategoria(Categoria categoria) {
    final _$actionInfo = _$_ProdutosDaCategoriaBaseActionController.startAction(
        name: '_ProdutosDaCategoriaBase.pesquisarPorProdutosDaCategoria');
    try {
      return super.pesquisarPorProdutosDaCategoria(categoria);
    } finally {
      _$_ProdutosDaCategoriaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoria: ${categoria}
    ''';
  }
}
