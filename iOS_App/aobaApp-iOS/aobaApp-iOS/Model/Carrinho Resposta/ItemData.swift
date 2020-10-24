//
//  itensData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 07/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class ItemData {
    let anuncioId: CLong
    let dataEntrega: DataEntregaData
    let foto: String
    let quantidade: Int
    let valor: Float
    let produtoNome: String
    
    init(anuncioId: CLong, dataEntrega: DataEntregaData, foto: String, quantidade: Int, valor: Float, nome: String) {
        self.anuncioId = anuncioId
        self.dataEntrega = dataEntrega
        self.foto = foto
        self.quantidade = quantidade
        self.valor = valor
        self.produtoNome = nome
    }
    
    static func jsonToObject(dict: Dictionary<String, Any>) -> ItemData {
        let anuncioId = dict["anuncioId"] as! CLong
        let dataEntrega = DataEntregaData.jsonToObject(dict: dict["dataEntrega"] as! Dictionary<String, Any>)
        let foto = dict["foto"] as! String
        let quantidade = dict["quantidade"] as! Int
        let valor = Float(dict["valor"] as! Double)
        let nome = dict["produtoNome"] as! String
        
        return ItemData(anuncioId: anuncioId, dataEntrega: dataEntrega, foto: foto, quantidade: quantidade, valor: valor, nome: nome)
    }
    
}



/*
 {
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
