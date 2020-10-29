//
//  DetalhesPedidoData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 28/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class DetalhesPedidoData {
    let endereco: EnderecoPedidoData
    let itens: [ItemDoPedidoData]
    let metodoPagamento: String
    let totalFrete: Float
    let totalItens: Float
    let totalPedido: Float
    
    
    init(endereco: EnderecoPedidoData, itens: [ItemDoPedidoData], metodoPagamento: String, totalFrete: Float, totalItens: Float, totalPedido: Float) {
        self.endereco = endereco
        self.itens = itens
        self.metodoPagamento = metodoPagamento
        self.totalFrete = totalFrete
        self.totalItens = totalItens
        self.totalPedido = totalPedido
    }
    
    static func dictToObject(dict: Dictionary<String, Any>) -> DetalhesPedidoData {
        let enderecoDict = dict["enderecoEntrega"] as! Dictionary<String, Any>
        let endereco = EnderecoPedidoData.dictToObject(dict: enderecoDict)
        
        let itensDict = dict["itens"] as! [Dictionary<String, Any>]
        var itens = [ItemDoPedidoData]()
        for itemDict in itensDict {
            itens.append(ItemDoPedidoData.dictToObject(dict: itemDict))
        }
        
        let metodoPagamento = dict["metodoPagamento"] as! String
        let totalFrete = Float(dict["totalFrete"] as! Double)
        let totalItens = Float(dict["totalItens"] as! Double)
        let totalPedido = Float(dict["totalPedido"] as! Double)
        
        
        return DetalhesPedidoData(endereco: endereco, itens: itens, metodoPagamento: metodoPagamento, totalFrete: totalFrete, totalItens: totalItens, totalPedido: totalPedido)
        
        
    }
}




/*
 
 "detalhes": {
   "enderecoEntrega": {
     "bairro": "string",
     "cidadeUf": "string",
     "logradouroNumero": "string"
   },
   "itens": [
     {
       "entrega": "SEG",
       "foto": "string",
       "id": 0,
       "nomeItem": "string",
       "qtde": 0,
       "statusItem": "PENDENTE",
       "total": 0
     }
   ],
   "metodoPagamento": "string",
   "totalFrete": 0,
   "totalItens": 0,
   "totalPedido": 0
 },
 
 **/
