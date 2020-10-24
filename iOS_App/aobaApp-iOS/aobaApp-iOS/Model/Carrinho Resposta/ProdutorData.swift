//
//  ProdutorData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 07/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class ProdutorData {
    let id: CLong
    let codigoRegistro: String
    let descricao: String
    let diasAtendimento: [DiaSemana]
    let email: String
    let foto: String
    let nome: String
    let rating: Float
    let nomeFantasia: String
    let telefone: String
    
    init(id: CLong, codigoRegistro: String, descricao: String, diasAtendimento: [DiaSemana], email: String, foto: String, nome: String, rating: Float, nomeFantasia: String, telefone: String) {
        self.id = id
        self.codigoRegistro = codigoRegistro
        self.descricao = descricao
        self.diasAtendimento = diasAtendimento //
        self.email = email
        self.foto = foto
        self.nome = nome
        self.rating = rating
        self.nomeFantasia = nomeFantasia
        self.telefone = telefone
    }
    
    static func jsonToObject(dict: Dictionary<String, Any>) -> ProdutorData {
        let id = dict["id"] as! CLong
        let codigoRegistro = dict["codigoRegistro"] as! String
        let descricao = dict["descricao"] as! String
        let email = dict["email"] as! String
        let foto = dict["foto"] as! String
        let nome = dict["nome"] as! String
        let rating = dict["rating"] as! Float
        let telefone = dict["telefone"] as! String
        let diasAtendimentoString = dict["diasAtendimento"] as! [String]
        let nomeFantasia = dict["nomeFantasia"] as! String
        
        var diasAtendimento = [DiaSemana]()
        for diaAtendimentoString in diasAtendimentoString {
            diasAtendimento.append(DiaSemana.fromString(string: diaAtendimentoString))
        }
        
        return ProdutorData(id: id, codigoRegistro: codigoRegistro, descricao: descricao, diasAtendimento: diasAtendimento, email: email, foto: foto, nome: nome, rating: rating, nomeFantasia: nomeFantasia, telefone: telefone)
        
    }
}

/*nome: String
 {rating: Float
   "codigsenha: StringoRegistro": "string",
   "descrtelefone: Stringicao": "string",
   "diasAtendimento": [
     "SEG"
   ],
   "email": "string",
   "foto": "string",
   "id": 0,
   "nome": "string",
   "nomeFantasia": "string",
   "rating": 0,
   "senha": "string",
   "telefone": "string"
 }
 **/
