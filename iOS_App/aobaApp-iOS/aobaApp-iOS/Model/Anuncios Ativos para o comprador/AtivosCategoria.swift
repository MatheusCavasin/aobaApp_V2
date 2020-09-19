//
//  AtivosCategoria.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class AtivosCategoria {
    let categoria: String!
    let foto: String!
    let produtos: [AtivosProduto]!
    
    init(categoria: String, foto: String, produtos: [AtivosProduto]) {
        self.categoria = categoria
        self.foto = foto
        self.produtos = produtos
    }
    
    
    static func dictToObject(dict: Dictionary<String, Any>) -> AtivosCategoria {
        let nomeCategoria = dict["categoria"] as! String
        let produtosDict = dict["produtos"] as! [Dictionary<String,Any>]
        let foto = dict["foto"] as! String
        
        var produtos: [AtivosProduto] = []
        
        for produtoDict in produtosDict {
            produtos.append(AtivosProduto.dictToObject(dict: produtoDict))
        }
        
        return AtivosCategoria(categoria: nomeCategoria, foto: foto, produtos: produtos)
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
