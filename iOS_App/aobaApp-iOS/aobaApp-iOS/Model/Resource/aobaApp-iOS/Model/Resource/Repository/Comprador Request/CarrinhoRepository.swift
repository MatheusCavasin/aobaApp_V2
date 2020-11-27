//
//  CarrinhoRepository.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 05/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class CarrinhoRepository {
    func getCarrinho(carrinhoPedido: CarrinhoPedido,
                     completion: @escaping (Any?, Error?) -> Void) {
        
        
        let url = "https://aoba-api-server.herokuapp.com/api/v1/pedido/carrinho"
        let carrinhoPedidoDict = carrinhoPedido.objectToDict()
        
        print(carrinhoPedidoDict)
        ApiResource.request(method: "POST", url: url, params: nil, body: carrinhoPedidoDict, withAuth: true) { (result, err) in
            completion(result, err)
        }
    }
    
    func fazerPedido(carrinhoPedido: CarrinhoPedido,
                     completion: @escaping (Any?, Error?) -> Void) {
        let url = "https://aoba-api-server.herokuapp.com/api/v1/pedido"
        let carrinhoPedidoDict = carrinhoPedido.objectToDict()
        ApiResource.request(method: "POST", url: url, params: nil, body: carrinhoPedidoDict, withAuth: true) { (result, err) in
            completion(result, err)
        }
    }
}


