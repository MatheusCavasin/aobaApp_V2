//
//  EnderecoDoPedidoData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 28/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class EnderecoPedidoData {
    let bairro: String
    let cidadeUf: String
    let logradouroNumero: String
    
    init(bairro: String, cidadeUf: String, logradouroNumero: String) {
        self.bairro = bairro
        self.cidadeUf = cidadeUf
        self.logradouroNumero = logradouroNumero
    }
    
    
    static func dictToObject(dict: Dictionary<String, Any>) -> EnderecoPedidoData {
        let bairro = dict["bairro"] as! String
        let cidade = dict["cidadeUf"] as! String
        let logradouroNumero = dict["logradouroNumero"] as! String
        
        return EnderecoPedidoData(bairro: bairro, cidadeUf: cidade, logradouroNumero: logradouroNumero)
    }
}


/*
 "enderecoEntrega": {
   "bairro": "string",
   "cidadeUf": "string",
   "logradouroNumero": "string"
 },
 **/
