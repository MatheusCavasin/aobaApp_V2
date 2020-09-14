//
//  AtivosCategoria.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class AtivosCategoria {
    let categoria: String!
    let foto: String!
    let produtos: [AtivosProduto]!
    
    init(categoria: String, foto: String, produtos: [AtivosProduto]) {
        self.categoria = categoria
        self.foto = foto
        self.produtos = produtos
    }
}
