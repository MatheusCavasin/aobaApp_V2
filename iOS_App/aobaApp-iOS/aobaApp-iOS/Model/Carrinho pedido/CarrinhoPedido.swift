//
//  Carrinho.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 22/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class CarrinhoPedido {
    var compradorId: CLong
    var enderecoId: CLong?
    var opcaoAlternativa: OpcaoAlternativa?
    var itensDoCarrinho: [ItemCarrinhoPedido]
    
    init(compradorId: CLong) {
        self.compradorId = compradorId
        self.itensDoCarrinho = []
        self.enderecoId = 105
    }
    
    init(compradorId: CLong, enderecoId: CLong, opcaoAlternativa: OpcaoAlternativa, itensDoCarrinho: [ItemCarrinhoPedido]) {
        self.compradorId = compradorId
        self.enderecoId = enderecoId
        self.opcaoAlternativa = opcaoAlternativa
        self.itensDoCarrinho = itensDoCarrinho
    }
    
    init(compradorId: CLong, enderecoId: CLong, itensDoCarrinho: [ItemCarrinhoPedido]) {
        self.compradorId = compradorId
        self.enderecoId = enderecoId
        self.itensDoCarrinho = itensDoCarrinho
    }
    
    public func objectToDict() -> Dictionary<String, Any> {
        var dict: Dictionary<String, Any> = [:]
        dict["compradorId"] = self.compradorId
        dict["enderecoId"] = self.enderecoId

        
        if self.opcaoAlternativa != nil {
            dict["opcaoAlternativa"] = self.opcaoAlternativa
        }
        
        // Decodificando os items do carinho e adicionando a uma lista de objetos separada
        var todosItems: [Dictionary<String, Any>] = [[String: Any]]()
        for item in itensDoCarrinho {
            let itemDict = item.objectToDict()
            todosItems.append(itemDict)
        }
        dict["itensCarrinho"] = todosItems
        return dict
    }
    
    static func dictToObject(dict: Dictionary<String, Any>) -> CarrinhoPedido {
        let compradorId = dict["compradorId"] as! CLong
        let enderecoId = dict["enderecoId"] as! CLong
    
        
        let itemsCarrinhoDict: [Dictionary<String, Any>] = dict["itensCarrinho"] as! [Dictionary<String, Any>]
        var todosItems: [ItemCarrinhoPedido] = []
        for item in itemsCarrinhoDict {
            let newItem = ItemCarrinhoPedido.dictToObject(dict: item)
            todosItems.append(newItem)
        }
        
        if dict["opcaoAlternativa"] != nil {
            let opcaoAlternativaString = dict["opcaoAlternativa"] as! String
            let opcaoAlternativa = OpcaoAlternativa.fromString(string: opcaoAlternativaString)
            return CarrinhoPedido(compradorId: compradorId, enderecoId: enderecoId, opcaoAlternativa: opcaoAlternativa, itensDoCarrinho: todosItems)
        } else {
            return CarrinhoPedido(compradorId: compradorId, enderecoId: enderecoId, itensDoCarrinho: todosItems)
        }
    }
}

enum OpcaoAlternativa {
    case ACEITAR_SUGESTAO
    case CANCELAR_PRODUTO
    
    static func fromString(string: String) -> OpcaoAlternativa {
        if string == "ACEITAR_SUGESTAO" {
            return .ACEITAR_SUGESTAO
        } else if string == "CANCELAR_PRODUTO" {
            return .CANCELAR_PRODUTO
        } else {
            return .ACEITAR_SUGESTAO
        }
    }
}



/*
 {
   "compradorId": 0,
   "enderecoId": 0,
   "itensCarrinho": [
     {
       "anuncioId": 0,
       "quantidade": 0
     },
     {
       "anuncioId": 0,
       "quantidade": 0
     },
     {
       "anuncioId": 0,
       "quantidade": 0
     }
   ],
   "opcaoAlternativa": "ACEITAR_SUGESTAO"
 }
 
 */
