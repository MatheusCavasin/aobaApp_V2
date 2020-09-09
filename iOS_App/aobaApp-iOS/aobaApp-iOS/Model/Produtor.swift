//
//  Produtor.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 11/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class Produtor: User {
    
    var codigo_registro: String
    var descricao: String
    
    
    
    init(email: String, senha: String, nome: String, codigo_registro: String, foto: String, descricao: String) {
        
        self.codigo_registro = codigo_registro
        self.descricao = descricao
        super.init(email: email, senha: senha, nome: nome, foto: foto)
    }
    
    
    func objectToDictrionary() -> Dictionary<String, Any>{
        var dict: Dictionary<String, Any> = [:]
        
        dict["email"] = self.email
        dict["senha"] = self.senha
        dict["nome"] = self.nome
        dict["codigo_registro"] = self.codigo_registro
        dict["foto"] = self.foto
        dict["descricao"] = self.descricao
        
        return dict
    }
    
    static func dictionaryToObject(dictionary: Dictionary<String, Any>) -> Produtor{
        
        var produtor: Produtor
        let email: String = dictionary["email"] as! String
        let senha: String = dictionary["senha"] as! String
        let nome: String = dictionary["nome"] as! String
        let codigo_registro: String = dictionary["codigo_registro"] as! String
        let foto: String = dictionary["foto"] as! String
        let descricao: String = dictionary["descricao"] as! String
        
        produtor = Produtor(email: email, senha: senha, nome: nome, codigo_registro: codigo_registro, foto: foto, descricao: descricao)
        
        return produtor
    }
    
}
