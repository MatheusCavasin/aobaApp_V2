//
//  CategoriaProduto.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 11/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class CategoriaProduto{
    var nome: String
    var foto: String
    var tipoProduto: TipoProduto
    
    init(nome: String, foto: String, tipoProduto: TipoProduto) {
        self.nome = nome
        self.foto = foto
        self.tipoProduto = tipoProduto
    }
}
