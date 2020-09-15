//
//  AtivosAnuncios.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class AtivosAnuncio {
    let id: CLong!
    let valor: Float!
    var qtdeMax: Int!
    let produtor: AtivosProdutor!
    let diasDisponiveis: [String]!
    
    init(id: CLong, valor: Float, qtdeMax: Int, produtor: AtivosProdutor, diasDisponiveis: [String]) {
        self.id = id
        self.valor = valor
        self.qtdeMax = qtdeMax
        self.produtor = produtor
        self.diasDisponiveis = diasDisponiveis
    }
    
    
}
