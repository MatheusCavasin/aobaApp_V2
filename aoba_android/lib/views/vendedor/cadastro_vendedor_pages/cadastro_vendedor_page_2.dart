import 'package:aoba_android/controllers/cadastro_vendedor_controller.dart';
import 'package:aoba_android/views/comprador/menu_comprador_page.dart';
import 'package:aoba_android/views/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../buttons_widgets.dart';
import '../../input_text_field_widgets.dart';

class CadastroVendedorDois extends StatelessWidget {
  @override
  final CadastroVendedorController controller;

  const CadastroVendedorDois({Key key, this.controller}) : super(key: key);

  Widget build(BuildContext context) {
    
    entrar(route) {
      if (controller.cadastrarUsuario() == true) {
        return Navigator.push(context, MaterialPageRoute(builder: (context) => route));
      }
      else {
        return SnackBar(
          content:  Text('erro'),
        );
      }
    }

    _botaoCadastrar({text, enable, route, context}) {
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
                final snackbar = SnackBar(
                  content: Text('failed'),
                );
                Scaffold.of(context).showSnackBar(snackbar);
              } : null,
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.only(top: 20),
                child: Image.asset('assets/images/cadastro-comerciante2.png'),
              ),
              Column(children: [
                Observer(
                  builder: (_) {
                    return InputTextField(
                      placeholder: 'Nome fantasia',
                      onChanged: controller.setNomeFantasia,
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return InputTextField(
                      placeholder: 'CPF ou CNPJ',
                      onChanged: controller.setCogigoRegistro,
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return InputTextField(
                      placeholder: 'Telefone',
                      onChanged: controller.setTelefone,
                    );
                  },
                )
              ]),
              Observer(
                builder: (_) {
                  return _botaoCadastrar(
                      context: context,
                      text: 'Cadastrar',
                      enable: controller.validarCampos(),
                      route: MenuComprador());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
