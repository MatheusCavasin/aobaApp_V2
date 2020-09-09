//
//  User.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 04/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class User{
    
    var email: String
    var senha: String
    var nome: String
    var foto: String
    
    init(email: String, senha: String, nome: String, foto: String){
        
        self.email = email
        self.senha = senha
        self.nome = nome
        self.foto = foto
    }
}
