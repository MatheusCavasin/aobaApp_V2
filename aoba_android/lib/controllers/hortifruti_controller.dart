import 'package:aoba_android/models/categorias.dart';
import 'package:aoba_android/models/produto.dart';
import 'package:mobx/mobx.dart';
part 'hortifruti_controller.g.dart';

class HortifrutiController = _HortifrutiControllerBase with _$HortifrutiController;

abstract class _HortifrutiControllerBase with Store {

  @observable
  List<List<Categoria>> categorias;


  @action
  obterCategorias() {
    //Ler api com todas as categorias
    categorias = [
      [
        Categoria('Abacaxi', 'assets/images/fruta-abacaxi.png', 'frutas'),
        Categoria('Abacate', 'assets/images/fruta-abacate.png', 'frutas'),
        Categoria('Mamao', 'assets/images/fruta-mamao.png', 'frutas'),
        Categoria('Banana', 'assets/images/banana-mini.png', 'frutas'),
        Categoria('Maça', 'assets/images/maca-gala.png', 'frutas'),
      ],
      [
        Categoria('Alface', 'assets/images/verdura-alface.png', 'verduras'),
        Categoria('Brocolis', 'assets/images/verdura-brocolis.png', 'verduras'),
        Categoria('Couve-flor', 'assets/images/verdura-couveflor.png', 'verduras'),
      ],
      [
        Categoria('Beterraba', 'assets/images/legume-beterraba.png', 'legumes'),
        Categoria('Milho', 'assets/images/legume-milho.png', 'legumes'),
        Categoria('Rabanete', 'assets/images/legume-rabanete.png', 'legumes'),
      ]
    ];
  }
}
