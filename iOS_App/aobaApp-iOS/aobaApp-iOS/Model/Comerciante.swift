//
//  Comerciante.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 04/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation



class Comerciante: User {
    
    var tipoComercio: TipoComercio
    var endereco: Endereco
    
    init(email: String, senha: String, nome: String, foto: String, tipoComercio: TipoComercio, endereco: Endereco){
        self.tipoComercio = tipoComercio
        self.endereco = endereco
        super.init(email: email, senha: senha, nome: nome, foto: foto)
    }
}
