
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'extensions.dart';

class TitleTexts extends StatelessWidget {
  @override
  final text;
  const TitleTexts({Key key, this.text}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Price extends StatelessWidget {
  final double price;
  const Price({Key key, this.price}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'R\$ $price caixa',
        style: TextStyle(
          fontSize: 20,
          color: HexColor.fromHex('#707070'),
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  final double rating;
  const Rating({Key key, this.rating}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: HexColor.fromHex('#FDBA3A'),
          ),
          Text(
            '$rating ',
            style: TextStyle(
                color: HexColor.fromHex('#FDBA3A'),
                fontWeight: FontWeight.bold,
                fontSize: 13),
          )
        ],
      ),
    );
  }
}

class AvailableCartons extends StatelessWidget {
  @override
  final int availableCartons;

  const AvailableCartons({Key key, this.availableCartons}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$availableCartons caixas disponiveis',
      ),
    );
  }
}
