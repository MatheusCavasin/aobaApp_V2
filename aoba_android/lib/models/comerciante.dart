
import 'package:aoba_android/models/usuario.dart';

class Comerciante extends Usuario {
  String cnpj;
  Comerciante(String nome, String senha, String email, String foto, String nomeFantasia, String cnpj, String telefone){
    this.cnpj = cnpj;
    this.nome = nome;
    this.senha = senha;
    this.email = email;
    this.foto = foto;
    this.nomeFantasia = nomeFantasia;
    this.telefone = telefone;
  }

}