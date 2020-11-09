//
//  ItemDoPedidoData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 28/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class ItemDoPedidoData {
    let entrega: DiaSemana
    let foto: String
    let id: CLong
    let nomeItem: String
    let qtde: Int
    let statusItem: StatusPedido
    let total: Float
    
    init(entrega: DiaSemana, foto: String, id: CLong, nomeItem: String, qtde: Int, statusItem: StatusPedido, total: Float) {
    
        self.entrega = entrega
        self.foto = foto
        self.id = id
        self.nomeItem = nomeItem
        self.qtde = qtde
        self.statusItem = statusItem
        self.total = total
    }
    
    static func dictToObject(dict: Dictionary<String, Any>) -> ItemDoPedidoData {
        let entregaString = dict["entrega"] as! String
        let entrega = DiaSemana.fromString(string: entregaString)
        let foto = dict["foto"] as! String
        let id = dict["id"] as! CLong
        let nomeItem = dict["nomeItem"] as! String
        let qtde = dict["qtde"] as! Int
        let statusItemString = dict["statusItem"] as! String
        let statusItem = StatusPedido.fromString(statusItemString)
        let total = Float(dict["total"] as! Double)
    
        return ItemDoPedidoData(entrega: entrega!, foto: foto, id: id, nomeItem: nomeItem, qtde: qtde, statusItem: statusItem, total: total)
    }
}

/*
 
 "itens": [
   {
     "entrega": "SEG",
     "foto": "string",
     "id": 0,
     "nomeItem": "string",
     "qtde": 0,
     "statusItem": "PENDENTE",
     "total": 0
   }
 ],
 
 **/
