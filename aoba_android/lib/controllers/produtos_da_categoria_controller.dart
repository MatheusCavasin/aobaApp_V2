import 'package:aoba_android/models/categorias.dart';
import 'package:aoba_android/models/produto.dart';
import 'package:mobx/mobx.dart';
part 'produtos_da_categoria_controller.g.dart';

class ProdutosDaCategoria = _ProdutosDaCategoriaBase with _$ProdutosDaCategoria;

abstract class _ProdutosDaCategoriaBase with Store {
  
  @observable
  List<Produto> categoria;

  @action
  pesquisarPorProdutosDaCategoria(Categoria categoria){
    // Fazer request da api e popular esse vetor
    List<Produto> categoria_maca = [
      Produto('Maça Gala', 'assets/images/maca-gala.png', categoria),
      Produto('Maça Gala', 'assets/images/maca-gala.png', categoria),
      Produto('Maça Gala', 'assets/images/maca-gala.png', categoria),
      Produto('Maça Gala', 'assets/images/maca-gala.png', categoria),
    ];
  }
}