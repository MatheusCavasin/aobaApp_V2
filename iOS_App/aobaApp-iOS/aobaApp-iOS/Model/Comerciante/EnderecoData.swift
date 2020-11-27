//
//  EnderecoData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class EnderecoData {
    var bairro: String
    var cep: String
    var cidade: String
    var complemento: String
    var id: CLong
    var latitude: Int
    var longitude: Int
    var logradouro: String
    var numero: Int
    var uf: String
    
    
    init(bairro: String, cep: String, cidade: String, complemento: String, id: Int, latitude: Int, longitude: Int, logradouro: String, numero: Int, uf: String) {
        self.bairro = bairro
        self.cep = cep
        self.cidade = cidade
        self.complemento = complemento
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.logradouro = logradouro
        self.numero = numero
        self.uf = uf
    }
    
    
    static func dictToObject(dict: Dictionary<String, Any>) -> EnderecoData {
        let bairro = dict["bairro"] as! String
        let cep = dict["cep"] as! String
        let cidade = dict["cidade"] as! String
        let complemento = String(dict["complemento"]  as! String)
        let id = dict["id"] as! CLong
        let latitude = 10 // dict["latitude"] as! Int
        let longitude = 10 // dict["longitude"] as! Int
        let logradouro = dict["logradouro"] as! String
        let numero = dict["numero"] as! Int
        let uf = dict["uf"] as! String
        
        return EnderecoData(bairro: bairro, cep: cep, cidade: cidade, complemento: complemento, id: id, latitude: latitude, longitude: longitude, logradouro: logradouro, numero: numero, uf: uf)
    }
    
    
    
    func objectToDictrionary() -> Dictionary<String, Any> {
        var dict: Dictionary<String, Any> = [:]
        
        dict["bairro"] = self.bairro
        dict["cep"] = self.cep
        dict["cidade"] = self.cidade
        dict["complemento"] = self.complemento
        dict["id"] = self.id
        dict["latitude"] = self.latitude
        dict["longitude"] = self.longitude
        dict["logradouro"] = self.logradouro
        dict["numero"] = self.numero
        dict["uf"] = self.uf
        
        return dict
    }
}


class EnderecoDataVenda {
    var bairro: String
    var cep: String
    var cidade: String
    var complemento: String
    var id: CLong
    var logradouro: String
    var numero: Int
    var uf: String
    
    
    init(bairro: String, cep: String, cidade: String, complemento: String, id: Int, logradouro: String, numero: Int, uf: String) {
        self.bairro = bairro
        self.cep = cep
        self.cidade = cidade
        self.complemento = complemento
        self.id = id
        self.logradouro = logradouro
        self.numero = numero
        self.uf = uf
    }
    
    
    static func dictToObject(dict: Dictionary<String, Any>) -> EnderecoDataVenda {
        let bairro = dict["bairro"] as! String
        let cep = dict["cep"] as! String
        let cidade = dict["cidade"] as! String
        let complemento = String(dict["complemento"]  as! String)
        let id = dict["id"] as! CLong
        let logradouro = dict["logradouro"] as! String
        let numero = dict["numero"] as! Int
        let uf = dict["uf"] as! String
        
        return EnderecoDataVenda(bairro: bairro, cep: cep, cidade: cidade, complemento: complemento, id: id, logradouro: logradouro, numero: numero, uf: uf)
    }
    
    
    
    func objectToDictrionary() -> Dictionary<String, Any> {
        var dict: Dictionary<String, Any> = [:]
        
        dict["bairro"] = self.bairro
        dict["cep"] = self.cep
        dict["cidade"] = self.cidade
        dict["complemento"] = self.complemento
        dict["id"] = self.id
        dict["logradouro"] = self.logradouro
        dict["numero"] = self.numero
        dict["uf"] = self.uf
        
        return dict
    }
    
}









/*
{
  "cnpj": "string",
  "email": "string",
  "enderecos": [
    {
      "bairro": "string",
      "cep": "string",
      "cidade": "string",
      "complemento": "string",
      "id": 0,
      "latitude": 0,
      "logradouro": "string",
      "longitude": 0,
      "numero": 0,
      "uf": "string"
    }
  ],
  "foto": "string",
  "id": 0,
  "nome": "string",
  "nomeFantasia": "string",
  "rating": 0
}

 */
