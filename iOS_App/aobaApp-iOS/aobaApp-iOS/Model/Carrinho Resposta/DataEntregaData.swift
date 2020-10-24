//
//  DataEntregaData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 07/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class DataEntregaData {
    let data: String
    let diaSemana: DiaSemana
    
    init(data: String, diaSemana: DiaSemana) {
        self.data = data
        self.diaSemana = diaSemana
    }
    
    static func jsonToObject(dict: Dictionary<String, Any>) -> DataEntregaData{
        let data = dict["data"] as! String
        let diaSemana = dict["diaSemana"] as! String
    
        return DataEntregaData(data: data, diaSemana: DiaSemana.fromString(string: diaSemana))
    }    
}

enum DiaSemana {
    case SEG
    case TER
    case QUA
    case QUI
    case SEX
    
    var dia: String? {
        switch self {
        case .SEG:
            return "SEG"
        case .TER:
            return "TER"
        case .QUA:
            return "QUA"
        case .QUI:
            return "QUI"
        case .SEX:
            return "SEX"
        }
    }
    
    var fullName: String? {
        switch self {
        case .SEG:
            return "Segunda"
        case .TER:
            return "Terça"
        case .QUA:
            return "Quarta"
        case .QUI:
            return "Quinta"
        case .SEX:
            return "Sexta"
        }
    }
    
    static func fromString(string: String) -> DiaSemana {
        if string == "SEG" {
            return .SEG
        } else if string == "TER" {
            return .TER
        } else if string == "QUA" {
            return .QUA
        } else if string == "QUI" {
            return .QUI
        } else {
            return .SEX
        }
    }

}


/*
 {
   "datasEntrega": [
     {
       "data": "string",
       "diaSemana": "SEG"
     }
   ],
   "itens": [
     {
       "anuncioId": 0,
       "dataEntrega": {
         "data": "string",
         "diaSemana": "SEG"
       },
       "foto": "string",
       "quantidade": 0,
       "valor": 0
     }
   ],
   "produtores": [
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
   ],
   "requisicaoCriar": {
     "compradorId": 0,
     "enderecoId": 0,
     "itensCarrinho": [
       {
         "anuncioId": 0,
         "quantidade": 0
       }
     ],
     "opcaoAlternativa": "ACEITAR_SUGESTAO"
   },
   "valorFrete": 0,
   "valorTotal": 0
 }
 */
