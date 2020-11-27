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
    var telefone: String
    var nomeFantasia: String
    var descricao: String
    var diasAtendimento: [DiaSemana]
    var id: CLong
    var rating: Float
    
    init(id: CLong = 0, rating: Float = 0.0, email: String, senha: String = "", nome: String, telefone: String, codigo_registro: String, nomeFantasia: String, foto: String, descricao: String, diasAtendimento: [DiaSemana]) {
        self.codigo_registro = codigo_registro
        self.descricao = descricao
        self.diasAtendimento = diasAtendimento
        self.nomeFantasia = nomeFantasia
        self.telefone = telefone
        self.id = id
        self.rating = rating
        super.init(email: email, senha: senha, nome: nome, foto: foto)
    }
    
    func objectToDictrionary() -> Dictionary<String, Any>{
        var dict: Dictionary<String, Any> = [:]
        dict["email"] = self.email
        dict["senha"] = self.senha
        dict["nome"] = self.nome
        dict["email"] = self.email
        dict["codigoRegistro"] = self.codigo_registro
        dict["foto"] = self.foto
        dict["descricao"] = self.descricao
        dict["diasAtendimento"] = diasAtendimento.map( {$0.dia} )
        dict["nomeFantasia"] = self.nomeFantasia
        dict["telefone"] = self.telefone
    
        return dict
    }
    
    static func dictionaryToObject(dictionary: Dictionary<String, Any>) -> Produtor{
        var produtor: Produtor
        let email: String = dictionary["email"] as! String
        let nome: String = dictionary["nome"] as! String
        let codigo_registro: String = dictionary["codigoRegistro"] as! String
        let foto: String = dictionary["foto"] as! String
        let descricao: String = dictionary["descricao"] as! String
        let diasAtendimentoString = dictionary["diasAtendimento"] as? [String]
        let nomeFantasia = dictionary["nomeFantasia"] as! String
        let telefone = dictionary["telefone"] as! String
        let id = dictionary["id"] as! Int
        let rating = Float(dictionary["rating"] as! Double)
        var diasSemana = [DiaSemana]()
        diasAtendimentoString?.forEach({ (diaSemanaString) in
            diasSemana.append(DiaSemana.fromString(string: diaSemanaString)!)
        })
        produtor = Produtor(id: id, rating: rating, email: email, nome: nome, telefone: telefone, codigo_registro: codigo_registro, nomeFantasia: nomeFantasia ,foto: foto, descricao: descricao, diasAtendimento: diasSemana)
        return produtor
    }
        
}




/*
 
 
 {
     "codigoRegistro": "codigo3",
     "nome": "Matheus Cavasin",
     "nomeFantasia": "Fazenda da Grana",
     "descricao": "Produtor de verduras em curitiba",
     "email": "matheus@redeaoba.com.br",
     "telefone": "41999995566",
     "senha": "123456",
     "foto": "foto-cavasin",
     "diasAtendimento": [
         "QUA",
         "SEX"
   ]
 }
 
 {
   "codigoRegistro": "string",
   "descricao": "string",
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
