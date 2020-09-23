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
    var enderecoId: CLong
    var opcaoAlternativa: String
    var itensDoCarrinho: [ItemCarrinhoPedido]
    
    init(compradorId: CLong, enderecoId: CLong, opcaoAlternativa: String, itensDoCarrinho: [ItemCarrinhoPedido]) {
        self.compradorId = compradorId
        self.enderecoId = enderecoId
        self.opcaoAlternativa = opcaoAlternativa
        self.itensDoCarrinho = itensDoCarrinho
    }
    
    init(compradorId: CLong, opcaoAlternativa: String, itensDoCarrinho: [ItemCarrinhoPedido]) {
        self.compradorId = compradorId
        self.enderecoId = -1
        self.opcaoAlternativa = opcaoAlternativa
        self.itensDoCarrinho = itensDoCarrinho
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
     }
   ],
   "opcaoAlternativa": "ACEITAR_SUGESTAO"
 }
 
 */
