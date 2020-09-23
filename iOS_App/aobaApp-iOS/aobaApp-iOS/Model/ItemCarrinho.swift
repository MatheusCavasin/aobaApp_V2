//
//  ItemCarrinho.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 22/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation
class ItemCarrinho {
    var anuncio: AtivosAnuncio
    var nomeProduto: String
    
    init(nome: String, anuncio: AtivosAnuncio) {
        self.nomeProduto = nome
        self.anuncio = anuncio
    }
}
