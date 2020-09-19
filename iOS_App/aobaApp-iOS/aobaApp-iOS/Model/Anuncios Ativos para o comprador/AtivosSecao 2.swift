//
//  AtivosSecao.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class AtivosSecao {
    let secao: String!
    let categorias: [AtivosCategoria]!
    
    init(secao: String, categorias: [AtivosCategoria]) {
        self.secao = secao
        self.categorias = categorias
    }
    
    static func dictToObject(dict: Dictionary<String, Any>) -> AtivosSecao {
        let nomeSecao = dict["secao"] as! String
        let categoriasDict = dict["categorias"] as! [Dictionary<String, Any>]
        
        var categorias: [AtivosCategoria] = []
        
        for categoriaDict in categoriasDict {
            categorias.append(AtivosCategoria.dictToObject(dict: categoriaDict))
        }
        
        return AtivosSecao(secao: nomeSecao, categorias: categorias)
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
