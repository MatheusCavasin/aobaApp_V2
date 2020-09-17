//
//  AtivosProdutos.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class AtivosProduto {
    let nome: String!
    let anuncios: [AtivosAnuncio]!
    
    init(nome: String, anuncio: [AtivosAnuncio]) {
        self.nome = nome
        self.anuncios = anuncio
    }
    
    static func dictToObject(dict: Dictionary<String, Any>) -> AtivosProduto {
        let nome = dict["nome"] as! String
        let anunciosDict = dict["anuncios"] as! [Dictionary<String, Any>]
        
        var anuncios: [AtivosAnuncio] = []
        
        for anuncioDict in anunciosDict {
            anuncios.append(AtivosAnuncio.dictToObject(dict: anuncioDict))
        }
        
        
        return AtivosProduto(nome: nome, anuncio: anuncios)
        
        
        
        
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
