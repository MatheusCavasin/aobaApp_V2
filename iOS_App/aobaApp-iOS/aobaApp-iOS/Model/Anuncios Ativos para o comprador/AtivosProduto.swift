//
//  AtivosProdutos.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class AtivosProduto {
    let nome: String!
    let anuncio: AtivosAnuncio!
    
    init(nome: String, anuncio: AtivosAnuncio) {
        self.nome = nome
        self.anuncio = anuncio
    }
}
