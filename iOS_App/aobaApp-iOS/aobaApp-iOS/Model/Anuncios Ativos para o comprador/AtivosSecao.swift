//
//  AtivosSecao.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class AtivosSecao {
    let secao: String!
    let categorias: [AtivosCategoria]!
    
    init(secao: String, categorias: [AtivosCategoria]) {
        self.secao = secao
        self.categorias = categorias
    }
    
}
