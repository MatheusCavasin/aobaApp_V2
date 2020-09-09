import 'package:aoba_android/models/produtor.dart';
import 'package:aoba_android/repositories/produtor_repository.dart';
import 'package:mobx/mobx.dart';
part 'cadastro_vendedor_controller.g.dart';

class CadastroVendedorController = _CadastroVendedorControllerBase with _$CadastroVendedorController;

abstract class _CadastroVendedorControllerBase with Store {
  @observable
  String nome;
  @action
  setNome(String nome){
    this.nome = nome;
  } 

  @observable 
  String email;
  @action
  setEmail(String email) => this.email = email;

  @observable
  String senha;
  @action
  setSenha(String senha) => this.senha = senha;

  @observable
  String confirmacaoDeSenha;
  @action
  setConfirmacaoDeSenha(String confirmacao) => this.confirmacaoDeSenha = confirmacao;

  @observable
  String nomeFantasia;
  @action 
  setNomeFantasia(String nomeFantasia) => this.nomeFantasia = nomeFantasia;

  @observable
  String codigoRegistro;
  @action 
  setCogigoRegistro(String codigoRegistro) => this.codigoRegistro = codigoRegistro;

  @observable
  String telefone;
  @action 
  setTelefone(String telefone) => this.telefone = telefone;

  final repoitory = ProdutorRepository();
  String foto = 'assets/images/logo.png';
  Produtor produtor;

  cadastrarUsuario(){
    produtor = Produtor(nome, senha, email, foto, nomeFantasia, codigoRegistro, telefone, ' ');
    return repoitory.cadastrarProdutor(produtor);
  }
  
  validarPrimeirosCampos(){
    if (nome != '' && email != '' && senha != '' && confirmacaoDeSenha != '') {
      if (nome != null && email != null && senha != null && confirmacaoDeSenha != null) {
        if (confirmacaoDeSenha == senha) {
          return true;
        }
      }
    }
    return false;   
  }

  validarCampos(){
    if (nomeFantasia != null && nomeFantasia != '') {
      if (codigoRegistro != null && codigoRegistro != '') {
        if (telefone != null && telefone != '') {
          return true;
        }
      }
    }
    return false; 
  }

}