import 'package:aoba_android/controllers/hortifruti_controller.dart';
import 'package:aoba_android/views/buttons_widgets.dart';
import 'package:aoba_android/views/comprador/menu_comprador_page.dart';
import 'package:aoba_android/views/vendedor/cadastro_vendedor_pages/cadastro_vendedor_page_1.dart';
import 'package:flutter/material.dart';

import '../input_text_field_widgets.dart';


class LoginVendedor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: EdgeInsets.only(top: 20),
              child: Image.asset('assets/images/logo.png'),
            ),
            
            Text('Faça login para continuar'),
            Container (
              child: Column(
                children: [
                  InputTextField(placeholder: 'Usuario'),
                  InputTextField(placeholder: 'Senha'),
                ]
              ),
            ),

            OrangeButton(text: 'Entrar', route: MenuComprador()),
            HollowButton(text: 'Criar uma nova conta', route: CadastroVendedorUm(), hexColor: '#FF7E1B')
          ],        
        ),
      ),
    );
  }
}

