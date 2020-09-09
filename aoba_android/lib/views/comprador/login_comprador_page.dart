import 'package:aoba_android/views/comprador/menu_comprador_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginComprador extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SignUpForm(),
        ),
      ),
    );
  }
}


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();


  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('Login', style: Theme
              .of(context)
              .textTheme
              .headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _userTextController,
              decoration: InputDecoration(hintText: 'Usuário'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: InputDecoration(hintText: 'Senha'),
            ),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuComprador()),
              );
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
