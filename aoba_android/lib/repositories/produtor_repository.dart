import 'dart:convert';
import 'dart:io';

import 'package:aoba_android/models/produtor.dart';
import 'package:aoba_android/models/singleton.dart';
import 'package:http/http.dart' as http;

class ProdutorRepository {
    var url = Singleton.shared.apiEndPoint + 'produtor';

    Future<bool> cadastrarProdutor(Produtor produtor) async {
      final http.Response response = await http.post(
        url,
        headers: <String, String>{          
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Basic ' + base64Encode(utf8.encode('carlos@redeaoba.com.br:123456')),
        },
        body: jsonEncode(<String, dynamic>{
          "codigoRegistro": produtor.codigoRegistro,
          "descricao": produtor.descricao,
          "email": produtor.email,
          "foto": produtor.foto,
          "nome": produtor.nome,
          "nomeFantasia": produtor.nomeFantasia,
          "senha": produtor.senha
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('created');
        return true;
      }
      else {
        print('failed');
        return false;
      }
    }
}

class HTTPHeaders {
}