//
//  CarrinhoData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 07/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


// Classe que decodifica a resposta da requisicao da criacao do carrinho
class CarrinhoData {
    var datasEntrega: [DataEntregaData]
    var itens: [ItemData]
    var produtores: [ProdutorData]
    var pedidoCriar: CarrinhoPedido
    var valorFrete: Float
    var valorTotal: Float
    
    init(datasEntrega: [DataEntregaData], itens: [ItemData], produtores: [ProdutorData], pedidoCriar: CarrinhoPedido, valorFrete: Float, valorTotal: Float) {
        self.datasEntrega = datasEntrega
        self.itens = itens
        self.produtores = produtores
        self.pedidoCriar = pedidoCriar
        self.valorFrete = valorFrete
        self.valorTotal = valorTotal
    }
    
    static func jsonToObject(dict: Dictionary<String, Any>) -> CarrinhoData {
        
        // Decodificando as datas de entrega
        let datasEntregaDict = dict["datasEntrega"] as! [Dictionary<String, Any>]
        var datasEntrega = [DataEntregaData]()
        for dataEntregaDict in datasEntregaDict {
            datasEntrega.append(DataEntregaData.jsonToObject(dict: dataEntregaDict))
        }
        
        // Decodificando os itens
        let itensDict = dict["itens"] as! [Dictionary<String, Any>]
        var itens = [ItemData]()
        for itemDict in itensDict {
            itens.append(ItemData.jsonToObject(dict: itemDict))
        }
        
        // Decodificando os produtores
        let produtoresDict = dict["produtores"] as! [Dictionary<String, Any>]
        var produtores = [ProdutorData]()
        for produtorDict in produtoresDict {
            produtores.append(ProdutorData.jsonToObject(dict: produtorDict))
        }
        
        // Decodificando pedido finalizado
        let carrinoPedidoDict = dict["requisicaoCriar"] as! Dictionary<String, Any>
        let carrinhoPedido = CarrinhoPedido.dictToObject(dict: carrinoPedidoDict)
        
        // Decodificando valores do frete e total
        let total = Float(dict["valorTotal"] as! Double)
        let frete = Float(dict["valorFrete"] as! Double)
        
        return CarrinhoData(datasEntrega: datasEntrega, itens: itens, produtores: produtores, pedidoCriar: carrinhoPedido, valorFrete: frete, valorTotal: total)
    }
}
    

    
    
/*
  "datasEntrega": [
    {
      "data": "string",
      "diaSemana": "SEG"
    }
  ],
  "itens": [
    {
      "anuncioId": 0,
      "dataEntrega": {
        "data": "string",
        "diaSemana": "SEG"
      },
      "foto": "string",
      "quantidade": 0,
      "valor": 0
    }
  ],
  "produtores": [
    {
      "codigoRegistro": "string",
      "descricao": "string",
      "diasAtendimento": [
        "SEG"
      ],
      "email": "string",
      "foto": "string",
      "id": 0,
      "nome": "string",
      "nomeFantasia": "string",
      "rating": 0,
      "senha": "string",
      "telefone": "string"
    }
  ],
  "requisicaoCriar": {
    "compradorId": 0,
    "enderecoId": 0,
    "itensCarrinho": [
      {
        "anuncioId": 0,
        "quantidade": 0
      }
    ],
    "opcaoAlternativa": "ACEITAR_SUGESTAO"
  },
  "valorFrete": 0,
  "valorTotal": 0
}

 */
