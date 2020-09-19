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
    
    
    var carrinho: [AtivosProduto] = []
    var anuncios: [AtivosSecao]! = []
    var loggedIn: Bool! = false
    var creatingUser: [String] = []
    
    var apiEndPoint = "https://aoba-api-server.herokuapp.com"
                       
    private init() {}
}



