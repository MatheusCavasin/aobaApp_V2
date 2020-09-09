import 'package:aoba_android/controllers/cadastro_vendedor_controller.dart';
import 'package:aoba_android/views/buttons_widgets.dart';
import 'package:aoba_android/views/input_text_field_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'cadastro_vendedor_page_2.dart';

class CadastroVendedorUm extends StatelessWidget {
  @override

  CadastroVendedorController controller = CadastroVendedorController();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset('assets/images/cadastro-comerciante1.png'),
                ),
                
                Column(
                  children: [
                    Observer(
                      builder:  (_) {
                        return InputTextField(
                          placeholder: 'Nome', 
                          onChanged: controller.setNome);
                      }
                    ),
                    
                    Observer(
                      builder:  (_) {
                        return InputTextField(
                          placeholder: 'Email', 
                          onChanged: controller.setEmail);
                      }
                    ),

                    Observer(
                      builder:  (_) {
                        return InputTextField(
                          placeholder: 'Senha', 
                          onChanged: controller.setSenha,
                          isPasswordField: true,
                        );
                      }
                    ),

                    Observer(
                      builder:  (_) {
                        return InputTextField(
                          placeholder: 'Confirmaçao de senha', 
                          onChanged: controller.setConfirmacaoDeSenha,
                          isPasswordField: true,
                        );
                      }
                    ),
                  ]
                ),
                Observer(
                  builder: (_) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: OrangeButton(
                        text: 'Proximo', 
                        route: CadastroVendedorDois(controller: controller), 
                        enable: controller.validarPrimeirosCampos()),
                    );
                  },
                )
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}