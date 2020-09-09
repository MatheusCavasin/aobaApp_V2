import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'extensions.dart';

class GreenButton extends StatelessWidget {
  final text;
  final route;
  final bool enable;

  const GreenButton({Key key, this.text, this.route, this.enable = true}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Container(
        child: SizedBox(
          width: double.infinity,
          height: 44.0,
          child: RaisedButton(
            child: Text(text),
            color: HexColor.fromHex('#00B62C'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              );
            },
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}


class OrangeButton extends StatelessWidget {
  final text;
  final route;
  final bool enable;


  const OrangeButton({Key key, this.text, this.route, this.enable = true, Function() action}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,
          height: 44.0,
          child: RaisedButton(
            child: Text(text),
            color: HexColor.fromHex('#FF7E1B'),
            textColor: Colors.white,
            onPressed: enable ? () {
              action;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route)
              );
            } : null,
          ),
        ),
      ),
    );
  }
}


class HollowButton extends StatelessWidget {
  final String hexColor;
  final String text;
  final route;

  const HollowButton({Key key, this.hexColor, this.text, this.route}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,
          height: 44.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: HexColor.fromHex(hexColor),
                width: 1,
                style: BorderStyle.solid
              ), 
            ),
            child: Text(text),
            color: Colors.white,
            textColor: HexColor.fromHex(hexColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route)
              );
            },
          ),
        ),
      ),
    );
  }
}

