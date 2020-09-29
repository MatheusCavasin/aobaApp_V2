//
//  AtivosAnuncios.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class AtivosAnuncio {
    let id: CLong!
    let image: [String]!
    let valor: Float!
    var qtdeMax: Int!
    let produtor: AtivosProdutor!
    let diasDisponiveis: [String]!
    
    init(id: CLong, image: [String], valor: Float, qtdeMax: Int, produtor: AtivosProdutor, diasDisponiveis: [String]) {
        self.id = id
        self.image = image
        self.valor = valor
        self.qtdeMax = qtdeMax
        self.produtor = produtor
        self.diasDisponiveis = diasDisponiveis
    }
    
    static func dictToObject(dict: Dictionary<String,Any>) -> AtivosAnuncio {
        let id = dict["id"] as! CLong
        let image = dict["fotos"] as! [String]
        //let image = dict["foto"] as! String
        let valor = Float(dict["valor"] as! Double)
        let qtdeMax = dict["qtdeMax"] as! Int
        let produtorDict = dict["produtor"] as! Dictionary<String, Any>
        let produtor = AtivosProdutor.dictToObject(dict: produtorDict)
        let diasDisponiveis = dict["diasDisponiveis"] as! [String]
        
        return AtivosAnuncio(id: id, image: image, valor: valor, qtdeMax: qtdeMax, produtor: produtor, diasDisponiveis: diasDisponiveis)
    }
    
    
    public func decrementarQuantidadeLocal(quantidade: Int) {
        for secao in Singleton.shared.anuncios {
            for categoria in secao.categorias {
                for produto in categoria.produtos {
                    for anuncio in produto.anuncios {
                        if anuncio.id == self.id {
                            anuncio.qtdeMax -= quantidade
                            return
                        }
                    }
                }
            }
        }
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
