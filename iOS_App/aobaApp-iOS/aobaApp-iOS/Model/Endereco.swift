//
//  Endereco.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 11/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class Endereco {
    var logradoura: String
    var numero: Int
    var bairro: String
    var cidade: String
    var UF: String
    var longitude: Float
    var latitude: Float
    var isPreferido: Bool
    
    init(logradoura: String, numero: Int, bairro: String, cidade: String, UF: String, longitude: Float, latitude: Float, isPreferido: Bool) {
        self.logradoura = logradoura
        self.numero = numero
        self.bairro = bairro
        self.cidade = cidade
        self.UF = UF
        self.longitude = longitude
        self.latitude = latitude
        self.isPreferido = isPreferido
    }
}
