//
//  AnunciosValidosRepository.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 16/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class AnunciosRepository {
    func getSecoesValidas() {
        let url = Singleton.shared.apiEndPoint + "/api/v1/anuncio/validos"
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true) { (result, err) in
            if let res:Bool = (err == nil) {
                if res {
                    print("Requisicão realizada com sucesso")
                    
                    var dictResult = result as! [Dictionary<String, Any>]
                    
                    
                    for dictSecao in dictResult {
                        Singleton.shared.anuncios.append(AtivosSecao.dictToObject(dict: dictSecao))
                    }
                    
                    

                }
            }
        }
    }
}


