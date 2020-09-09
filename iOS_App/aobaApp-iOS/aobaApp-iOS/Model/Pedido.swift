//
//  Pedido.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 11/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class Pedido {
    var itens: [ItemCarrinho]
    var valorTotal: Float
    
    
    init(itens: [ItemCarrinho], valorTotal: Float) {
        self.itens = itens
        self.valorTotal = valorTotal
    }
}
