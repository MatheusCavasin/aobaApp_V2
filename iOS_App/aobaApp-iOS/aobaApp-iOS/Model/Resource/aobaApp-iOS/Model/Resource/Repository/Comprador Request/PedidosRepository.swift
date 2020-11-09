//
//  PedidosRepository.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 28/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class PedidosRepository {
    func getPedidosComerciante(completion: @escaping (Any?, Error?) -> Void) {
        let url = Singleton.shared.apiEndPoint + "/api/v1/pedido/comerciante/\(Singleton.shared.comercianteLogado!.id)"
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true) { (result, err) in
            if let result = result {
                print(result)
                let fullDictResult = result as! [Dictionary<String, Any>]
                var pedidos = [PedidoData]()
                for dictResult in fullDictResult {
                    pedidos.append(PedidoData.dictToObject(dict: dictResult))
                }
                completion(pedidos, nil)
            }
        }
    }
    
}
