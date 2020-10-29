//
//  PerfilData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 24/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class PerfilData {
    var emailAntigo: String?
    var emailNovo: String?
    var nome: String?
    var nomeFantasia: String?
    var senhaAntiga: String?
    var novaSenha: String?
    var telefoneAntigo: String?
    var telefoneNovo: String?
    
    init(emailAntigo: String?, emailNovo: String?, nome: String?, nomeFantasia: String?, senhaAntiga: String?, novaSenha: String?, telefoneAntigo: String?, telefoneNovo: String?) {
        
        self.emailAntigo = emailAntigo
        self.emailNovo = emailNovo
        self.nome = nome
        self.nomeFantasia = nomeFantasia
        self.senhaAntiga = senhaAntiga
        self.novaSenha = novaSenha
        self.telefoneAntigo = telefoneAntigo
        self.telefoneNovo = telefoneNovo
    }
    
    
    func objectToDict() -> Dictionary<String, Any> {
        var dict: Dictionary<String, Any> = [:]
        
        if let emailAntigo = self.emailAntigo {
            dict["emailAntigo"] = emailAntigo
        }
        if let emailNovo = self.emailNovo {
            dict["emailNovo"] = emailNovo
        }
        if let nome = self.nome {
            dict["nome"] = nome
        }
        if let nomeFantasia = self.nomeFantasia {
            dict["nomeFantasia"] = nomeFantasia
        }
        if let senhaAntiga = self.senhaAntiga {
            dict["senhaAntiga"] = senhaAntiga
        }
        if let senhaNova = self.novaSenha {
            dict["senhaNova"] = senhaNova
        }
        if let telefoneAntigo = self.telefoneAntigo {
            dict["telefoneAntigo"] = telefoneAntigo
        }
        if let telefoneNovo = self.telefoneNovo {
            dict["telefoneNovo"] = telefoneNovo
        }
        
        return dict
    }
}


/*
{
  "emailAntigo": "string",
  "emailNovo": "string",
  "nome": "string",
  "nomeFantasia": "string",
  "senhaAntiga": "string",
  "senhaNova": "string",
  "telefoneAntigo": "string",
  "telefoneNovo": "string"
}
*/
