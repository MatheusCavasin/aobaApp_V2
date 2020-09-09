//
//  Produto.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 11/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class Produto {
    var nome: String
    var descricao:String
    var categoriaProduto: CategoriaProduto
    var fotos: [String]
    var valor: Float
    var qtdeMax: Int
    
    init(nome: String, descricao: String, categoriaProduto: CategoriaProduto, fotos: [String], valor: Float, qtdeMax: Int) {
        self.nome = nome
        self.descricao = descricao
        self.categoriaProduto = categoriaProduto
        self.fotos = fotos
        self.valor = valor
        self.qtdeMax = qtdeMax
    }
    
}
