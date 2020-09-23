//
//  ItemCarrinho.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 11/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class ItemCarrinhoPedido {
    var anuncioId: CLong
    var quantidade: Int
    
    init(anuncioId: CLong, quantidade: Int) {
        self.anuncioId = anuncioId
        self.quantidade = quantidade
    }
}
