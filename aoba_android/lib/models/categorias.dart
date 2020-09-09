
class Categoria {
  String nome;
  String foto;
  String classificacao;
 
  Categoria(String nome, String foto, String classificacao) {
    this.nome = nome;
    this.foto = foto;
    this.classificacao = classificacao;
  }
}

enum SecaoProduto {
  FRUTA,
  VERDURA,
  LEGUME
}
