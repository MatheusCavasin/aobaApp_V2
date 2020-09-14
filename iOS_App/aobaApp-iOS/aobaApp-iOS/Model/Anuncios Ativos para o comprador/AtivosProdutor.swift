//
//  AtivosProdutos.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class AtivosProdutor {
    let codigoProdutor: String!
    let descricao: String!
    let diasAtendimento: [String]!
    
    
    init(codigoProdutor: String, descricao: String, diasAtendimento: [String]) {
        self.codigoProdutor = codigoProdutor
        self.descricao = descricao
        self.diasAtendimento = diasAtendimento
    }
}
