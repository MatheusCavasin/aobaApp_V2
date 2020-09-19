//
//  ComercianteData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class ComercianteData {
    var cnpj: String
    var email: String
    var foto: String
    var id: Int
    var nome: String
    var nomeFantasia: String
    var rating: Float
    var enderecos: [EnderecoData]
    var senha: String
    
    init(cnpj: String, email: String, senha:String, foto: String, nome: String, nomeFantasia: String, rating: Float, enderecos: [EnderecoData]) {
        self.cnpj = cnpj
        self.email = email
        self.senha = senha
        self.foto = foto
        self.id = 0
        self.nome = nome
        self.nomeFantasia = nomeFantasia
        self.rating = rating
        self.enderecos = enderecos
    }
    
    
    
    static func dictToObject(dict: Dictionary<String, Any>) -> ComercianteData {
        let cnpj = dict["cnpj"] as! String
        let email = dict["email"] as! String
        let foto = dict["foto"] as! String
        let nome = dict["nome"] as! String
        let nomeFantasia = dict["nomeFantasia"] as! String
        let rating = dict["rating"] as! Float
        let senha = " "
        
        
        var enderecos: [EnderecoData] = []
        
        let enderecosDict = dict["enderecos"] as! [Dictionary<String, Any>]
        
        for enderecoDict in enderecosDict {
            enderecos.append(EnderecoData.dictToObject(dict: enderecoDict))
        }
        
        return ComercianteData(cnpj: cnpj, email: email, senha: senha, foto: foto, nome: nome, nomeFantasia: nomeFantasia, rating: rating, enderecos: enderecos)
    }
    
    
    func objectToDictrionary() -> Dictionary<String, Any>{
        var dict: Dictionary<String, Any> = [:]
        
        dict["cnpj"] = self.cnpj
        dict["email"] = self.email
        dict["foto"] = self.foto
        dict["id"] = 0
        dict["nome"] = self.nome
        dict["nomeFantasia"] = self.nomeFantasia
        dict["rating"] = 0
        dict["senha"] = self.senha
        
        var enderecosDict: [Dictionary<String, Any>] = []
        
        for endereco in enderecos {
            enderecosDict.append(endereco.objectToDictrionary())
        }
        dict["enderecos"] = enderecosDict
        
        return dict
    }
}

/*

{
  "cnpj": "string",
  "email": "string",
  "enderecos": [
    {
      "bairro": "string",
      "cep": "string",
      "cidade": "string",
      "complemento": "string",
      "id": 0,
      "latitude": 0,
      "logradouro": "string",
      "longitude": 0,
      "numero": 0,
      "uf": "string"
    }
  ],
  "foto": "string",
  "id": 0,
  "nome": "string",
  "nomeFantasia": "string",
  "rating": 0
}
*/
