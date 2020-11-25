//
//  PedidosData.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 28/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

enum StatusPedido {
    case realizado
    case pendente
    case confirmado
    case entregue
    case cancelado
    
    static func fromString(_ string: String) -> StatusPedido {
        switch string {
        case "REALIZADO":
            return .realizado
        case "PENDENTE":
            return .pendente
        case "CONFIRMADO":
            return .confirmado
        case "ENTREGUE":
            return .entregue
        default:
            return .cancelado
        }
    }
}

class PedidoData {
    let detalhes: DetalhesPedidoData
    let dtRealizado: String
    let nomeFantasiaComerciante: String
    let pedidoId: CLong
    var status: StatusPedido
    let telefoneComerciante: String
    
    init(detalhes: DetalhesPedidoData ,dtRealizado: String, nomeFantasiaComerciante: String, pedidoId: CLong, status: StatusPedido, telefoneComerciante: String) {
        self.detalhes = detalhes
        self.dtRealizado = dtRealizado
        self.nomeFantasiaComerciante = nomeFantasiaComerciante
        self.pedidoId = pedidoId
        self.status = status
        self.telefoneComerciante = telefoneComerciante
    }
    
    static func dictToObject(dict: Dictionary<String, Any>) -> PedidoData {
        let detalhesDict = dict["detalhes"] as! Dictionary<String, Any>
        let detalhes = DetalhesPedidoData.dictToObject(dict: detalhesDict)
        let dtRealizado = dict["dtRealizado"] as! String
        let nomeFantasiaComerciante = dict["nomeFantasiaComerciante"] as! String
        let pedidoId = dict["pedidoId"] as! CLong
        let statusString = dict["status"] as! String
        let status = StatusPedido.fromString(statusString)
        let telefoneComerciante = dict["telefoneComerciante"] as! String
        
        return PedidoData(detalhes: detalhes, dtRealizado: dtRealizado, nomeFantasiaComerciante: nomeFantasiaComerciante, pedidoId: pedidoId, status: status, telefoneComerciante: telefoneComerciante)
    }
}
    
    
    
   /*
     "detalhes": {
       "enderecoEntrega": {
         "bairro": "string",
         "cidadeUf": "string",
         "logradouroNumero": "string"
       },
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
       "metodoPagamento": "string",
       "totalFrete": 0,
       "totalItens": 0,
       "totalPedido": 0
     },
     "dtConfirmado": "2020-10-28T08:36:08.418Z",
     "dtRealizado": "2020-10-28T08:36:08.418Z",
     "nomeFantasiaComerciante": "string",
     "pedidoId": 0,
     "prazoEntrega": "2020-10-28T08:36:08.418Z",
     "status": "REALIZADO",
     "telefoneComerciante": "string"
   }
 */



