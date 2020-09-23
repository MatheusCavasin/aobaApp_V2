//
//  AtivosProdutos.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class AtivosProdutor {
    let codigoProdutor: String!
    let nomeFantasia: String
    let descricao: String!
    let diasAtendimento: [String]!
    
    
    
    init(codigoProdutor: String, nomeFantasia: String ,descricao: String, diasAtendimento: [String]) {
        self.codigoProdutor = codigoProdutor
        self.nomeFantasia = nomeFantasia
        self.descricao = descricao
        self.diasAtendimento = diasAtendimento
    }

    static func dictToObject(dict: Dictionary<String, Any>) -> AtivosProdutor {
        
        let codigo = dict["codigoRegistro"] as! String
        let descricao = dict["descricao"] as! String
        let nomeFantasia = dict["nomeFantasia"] as! String
        return AtivosProdutor(codigoProdutor: codigo, nomeFantasia: nomeFantasia, descricao: descricao, diasAtendimento: ["SEG", "TER", "QUA", "SEX"])
    }
}


/*
"secao": "FRUTA",
"categorias": [
  {
    "categoria": "Laranja",
    "foto": "fruta-laranja",
    "produtos": [
      {
        "nome": "Laranja Bahia",
        "foto": "fruta-laranja-bahia",
        "anuncios": [
          {
            "id": 55,
            "valor": 10.9,
            "qtdeMax": 14,
            "produtor": {
              "id": 2,
              "email": "carlos@redeaoba.com.br",
              "nome": "Carlos Modinez",
              "nomeFantasia": "Chácara de Taubaté",
              "foto": "foto-carlos",
              "codigoRegistro": "codigo2",
              "descricao": "Produtor de legumes em curitiba"
            }
          }
        ]
      }
    ]
  },
  {
    "categoria": "Maça",
    "foto": "fruta-maca",
    "produtos": [
      {
        "nome": "Maça Gala",
        "foto": "fruta-maca-gala",
        "anuncios": [
          {
            "id": 56,
            "valor": 10.9,
            "qtdeMax": 14,
            "produtor": {
              "id": 2,
              "email": "carlos@redeaoba.com.br",
              "nome": "Carlos Modinez",
              "nomeFantasia": "Chácara de Taubaté",
              "foto": "foto-carlos",
              "codigoRegistro": "codigo2",
              "descricao": "Produtor de legumes em curitiba"
            }
          }
        ]
      }
    ]
  },
*/
