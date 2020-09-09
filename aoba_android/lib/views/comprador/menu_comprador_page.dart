import 'package:aoba_android/controllers/hortifruti_controller.dart';
import 'package:aoba_android/models/categorias.dart';
import 'package:aoba_android/views/comprador/produtos_da_categoria_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MenuComprador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HortifrutiController controller = HortifrutiController();
    controller.obterCategorias();
    // Titulos da lista

    listTitle(title) {
      return Container(
        padding: const EdgeInsets.only(top: 0, left: 10),
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      );
    }
    // Cards da Lista

    // List
    listProducts(int size, List<Categoria> categoria) {
      return Container(
          height: 180,
          child: GridView.count(
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              children: List.generate(size, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdutosDaCategoria(tipoDeProduto: categoria[index].nome) ,
                      ),
                    );
                  },
                  child: Card(
                      image: categoria[index].foto,
                      title: categoria[index].nome),
                );
              })));
    }


    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Encontre produtos'),
            ),

            
            body: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20, left: 10, bottom: 30),
                  child: Text(
                    'Selecionados para voce',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'SF Pro Display-medium',
                        fontWeight: FontWeight.bold),
                  ),
                ),

                
                listTitle(controller.categorias[0][0].classificacao),
                listProducts(controller.categorias[0].length, controller.categorias[0]),

                listTitle(controller.categorias[1][0].classificacao),
                listProducts(controller.categorias[1].length, controller.categorias[1]),

                listTitle(controller.categorias[2][0].classificacao),
                listProducts(controller.categorias[2].length, controller.categorias[2]),
                
              ],
            )));
  }
}

class Card extends StatelessWidget {
  final image;
  final title;
  const Card({Key key, this.image, this.title});
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FittedBox(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 100,
                width: 140,
              ),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
