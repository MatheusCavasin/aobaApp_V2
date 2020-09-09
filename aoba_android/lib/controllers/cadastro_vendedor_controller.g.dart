// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_vendedor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroVendedorController on _CadastroVendedorControllerBase, Store {
  final _$nomeAtom = Atom(name: '_CadastroVendedorControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_CadastroVendedorControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_CadastroVendedorControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$confirmacaoDeSenhaAtom =
      Atom(name: '_CadastroVendedorControllerBase.confirmacaoDeSenha');

  @override
  String get confirmacaoDeSenha {
    _$confirmacaoDeSenhaAtom.reportRead();
    return super.confirmacaoDeSenha;
  }

  @override
  set confirmacaoDeSenha(String value) {
    _$confirmacaoDeSenhaAtom.reportWrite(value, super.confirmacaoDeSenha, () {
      super.confirmacaoDeSenha = value;
    });
  }

  final _$nomeFantasiaAtom =
      Atom(name: '_CadastroVendedorControllerBase.nomeFantasia');

  @override
  String get nomeFantasia {
    _$nomeFantasiaAtom.reportRead();
    return super.nomeFantasia;
  }

  @override
  set nomeFantasia(String value) {
    _$nomeFantasiaAtom.reportWrite(value, super.nomeFantasia, () {
      super.nomeFantasia = value;
    });
  }

  final _$codigoRegistroAtom =
      Atom(name: '_CadastroVendedorControllerBase.codigoRegistro');

  @override
  String get codigoRegistro {
    _$codigoRegistroAtom.reportRead();
    return super.codigoRegistro;
  }

  @override
  set codigoRegistro(String value) {
    _$codigoRegistroAtom.reportWrite(value, super.codigoRegistro, () {
      super.codigoRegistro = value;
    });
  }

  final _$_CadastroVendedorControllerBaseActionController =
      ActionController(name: '_CadastroVendedorControllerBase');

  @override
  dynamic setNome(String nome) {
    final _$actionInfo = _$_CadastroVendedorControllerBaseActionController
        .startAction(name: '_CadastroVendedorControllerBase.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$_CadastroVendedorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String email) {
    final _$actionInfo = _$_CadastroVendedorControllerBaseActionController
        .startAction(name: '_CadastroVendedorControllerBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_CadastroVendedorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenha(String senha) {
    final _$actionInfo = _$_CadastroVendedorControllerBaseActionController
        .startAction(name: '_CadastroVendedorControllerBase.setSenha');
    try {
      return super.setSenha(senha);
    } finally {
      _$_CadastroVendedorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConfirmacaoDeSenha(String confirmacao) {
    final _$actionInfo =
        _$_CadastroVendedorControllerBaseActionController.startAction(
            name: '_CadastroVendedorControllerBase.setConfirmacaoDeSenha');
    try {
      return super.setConfirmacaoDeSenha(confirmacao);
    } finally {
      _$_CadastroVendedorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNomeFantasia(String nomeFantasia) {
    final _$actionInfo = _$_CadastroVendedorControllerBaseActionController
        .startAction(name: '_CadastroVendedorControllerBase.setNomeFantasia');
    try {
      return super.setNomeFantasia(nomeFantasia);
    } finally {
      _$_CadastroVendedorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCogigoRegistro(String codigoRegistro) {
    final _$actionInfo = _$_CadastroVendedorControllerBaseActionController
        .startAction(name: '_CadastroVendedorControllerBase.setCogigoRegistro');
    try {
      return super.setCogigoRegistro(codigoRegistro);
    } finally {
      _$_CadastroVendedorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
senha: ${senha},
confirmacaoDeSenha: ${confirmacaoDeSenha},
nomeFantasia: ${nomeFantasia},
codigoRegistro: ${codigoRegistro}
    ''';
  }
}
