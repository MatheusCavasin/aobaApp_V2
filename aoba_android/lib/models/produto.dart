import 'categorias.dart';

class Produto{

  String nome;
  String foto;
  Categoria categoria;

  Produto(String nome, String foto, Categoria categoria) {
    this.foto = foto;
    this.nome = nome;
    this.categoria = categoria;
  }

}



