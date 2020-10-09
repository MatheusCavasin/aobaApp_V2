//
//  ItemCarrinho.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 11/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class ItemCarrinhoPedido {
    var anuncioId: CLong
    var quantidade: Int
    
    init(anuncioId: CLong, quantidade: Int) {
        self.anuncioId = anuncioId
        self.quantidade = quantidade
    }
    
    
    public func objectToDict() -> Dictionary<String, Any> {
        var dict: Dictionary<String, Any> = [:]
        
        dict["anuncioId"] = self.anuncioId
        dict["quantidade"] = self.quantidade
        
        return dict
    }
    
    static func dictToObject(dict: Dictionary<String, Any>) -> ItemCarrinhoPedido {
        let anuncioId = dict["anuncioId"] as! CLong
        let quantidade = dict["quantidade"] as! Int
        
        return ItemCarrinhoPedido(anuncioId: anuncioId, quantidade: quantidade)
    }
}
