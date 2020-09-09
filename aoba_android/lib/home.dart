import 'package:aoba_android/views/buttons_widgets.dart';
import 'package:aoba_android/views/comprador/login_comprador_page.dart';
import 'package:aoba_android/views/extensions.dart';
import 'package:aoba_android/views/vendedor/login_vendedor_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/singleton.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              
              padding: EdgeInsets.only(top: 50.0),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        
            // Buttons
            Container(
              padding: EdgeInsets.only(bottom: 100.0),
              child: Column(
                children: <Widget>[
                  GreenButton(text: 'Comprador', route: LoginComprador()),
                  OrangeButton(text: 'Vendedor', route: LoginVendedor())
                ],
              ),
            )
          ],
        ),
      ),    
    );
  }
}
