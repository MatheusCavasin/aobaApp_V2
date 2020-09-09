//
//  Anuncio.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 11/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class Anuncio {
    var produtos: [Produto]
    var dtCriacao: String
    var dtValidade: String
    
    
    init(produtos: [Produto], dtCriacao: String, dtValidade: String) {
        self.produtos = produtos
        self.dtCriacao = dtCriacao
        self.dtValidade = dtValidade
    }
}
