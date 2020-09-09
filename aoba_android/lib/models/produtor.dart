

import 'package:aoba_android/models/produto.dart';
import 'package:aoba_android/models/usuario.dart';

class Produtor extends Usuario {
  String codigoRegistro;
  String descricao;

  Produtor(String nome, String senha, String email, String foto, String nomeFantasia, String codigoRegistro, String descricao, String telefone) : super() {
    this.codigoRegistro = codigoRegistro;
    this.descricao = descricao;
    this.nome = nome;
    this.senha = senha;
    this.email = email;
    this.foto = foto;
    this.nomeFantasia = nomeFantasia;
    this.telefone = telefone;
  }

  Produtor.fromJson(Map<String, dynamic> json) {
    codigoRegistro = json['codigoRegistro'];
    descricao = json['descricao'];
    nome = json['nome'];
    senha = json['senha'];
    email = json['email'];
    foto = json['foto'];
    nomeFantasia = json['nomeFantasia'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigoRegistro'] = this.codigoRegistro;
    data['descricao'] = this.descricao;
    data['email'] = this.email;
    data['foto'] = this.foto;
    data['nome'] = this.nome;
    data['nomeFantasia'] = this.nomeFantasia;
    data['senha'] = this.senha;
    return data;
  }
}

