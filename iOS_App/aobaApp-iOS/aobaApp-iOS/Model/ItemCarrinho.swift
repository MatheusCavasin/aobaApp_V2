//
//  ItemCarrinho.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 11/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class ItemCarrinho {
    var produto: Produto
    var anuncioReferencia: Anuncio
    var preco: Float
    var quantidade: Int
    var comprador: Comerciante
    var vendedor: Produtor
    var status: StatusItem
    
    
    init(produto: Produto, anuncioReferencia: Anuncio, preco: Float, quantidade: Int, comprador: Comerciante, vendedor: Produtor, status: StatusItem) {
        self.produto = produto
        self.anuncioReferencia = anuncioReferencia
        self.preco = preco
        self.quantidade = quantidade
        self.comprador = comprador
        self.vendedor = vendedor
        self.status = status
    }
}
