import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../texts_widgets.dart';

class ProdutosDaCategoria extends StatelessWidget {
  final tipoDeProduto;

  const ProdutosDaCategoria({Key key, this.tipoDeProduto}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(tipoDeProduto),
      ),
      body: ListView(
          children: List.generate(10, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CelulaDoProduto(),
        );
      })),
    );
  }
}

class CelulaDoProduto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: 10.0,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.33,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100.0),
                  topRight: Radius.circular(100.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
                ),
                
                child: Image.asset(
                  "assets/images/fruta-mamao.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 16, left: 10, right: 10),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTexts(text: "Maça Gala"),
                  Price(price: 10.0),
                  Row(
                    children: <Widget>[
                      Rating(rating: 4.9),
                      Text(' • '),
                      AvailableCartons(availableCartons: 15)
                    ],
                  )
                ],
              )),
            ),

            Container(
              child: Icon(
                Icons.add,
                color: Colors.grey,
                size: MediaQuery.of(context).size.width * 0.07,
              ),
            )
          ],
        ),
      ),
    );
  }
}
