//
//  Singleton.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class Singleton {
    static var shared = Singleton()
    
    var carrinhoPedido: CarrinhoPedido?
    var enderecoDeEntrega: EnderecoData?
    var carrinho = Carrinho()
    var pedidos: [PedidoData]?
    var anuncios: [AtivosSecao]! = []
    var comercianteLogado: ComercianteData?
    
    var loggedIn: Bool! = false
    var creatingUser: [String] = []
    
    var apiEndPoint = "https://aoba-api-server.herokuapp.com"
                       
    private init() {}
}



