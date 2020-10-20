//
//  CompradorRepository.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 19/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class CompradorRepository {
    
    func create(comerciante: ComercianteData){
        let url  = Singleton.shared.apiEndPoint + "/api/v1/comerciante"
        let comercianteDict = comerciante.objectToDictrionary()
        
        //Chamando a funcão POST produtor
        ApiResource.request(method: "POST", url: url, params: nil, body: comercianteDict, withAuth: false){
            (result, err)  in
            //Aqui você tem seu resultado
            if result != nil {
                let resultDict = result as! Dictionary<String, Any>
                var statusCode: Int = 200
                
                if resultDict["statusCode"] != nil {
                    statusCode = (resultDict["statusCode"] as? Int)!
                }
                
                
                if statusCode == 200 {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "ComercianteCriado"), object: nil)
                        
                        // Decodificar o response para obter o id
                        
                    }
                } else {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "ErroAoCriarComerciante"), object: nil)
                    }
                }
                
            } else {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "ErroAoCriarComerciante"), object: nil)
                }
            }
            
        }
        print("ENTROU \n\n\n")}
    
    
    
    func login() {
        let url  = Singleton.shared.apiEndPoint + "/api/v1/comerciante/login"
        
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true) { (result, err) in
            
            if result != nil {
                print("sua requisicao foi realizada com sucesso")
                let resultDict = result as! Dictionary<String, Any>
                var statusCode: Int = 200
                
                if resultDict["status"] != nil {
                    statusCode = (resultDict["status"] as? Int)!
                }
                
                
                if statusCode == 200 {
                    DispatchQueue.main.async {
                        Singleton.shared.comercianteLogado = ComercianteData.dictToObject(dict: result as! Dictionary<String, Any>)
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "SucessoAoLogar"), object: nil)
                    }
                }
                    
                else {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "ErroAoLogar"), object: nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "ErroAoLogar"), object: nil)
                }
            }
            
        }
    }
    
    func addEndereco(endereco: EnderecoData) {
        
        if Singleton.shared.comercianteLogado == nil {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "ErroAoAdicionarEndereco"), object: nil)
            }
        } else {
            
            let url = Singleton.shared.apiEndPoint + "/api/v1/comerciante/\(Singleton.shared.comercianteLogado!.id)/endereco"
            let enderecoDict = endereco.objectToDictrionary()
            
            ApiResource.request(method: "POST", url: url, params: nil, body: enderecoDict, withAuth: true) { (result, err) in
                if result != nil {
                    print("Sucesso")
                    
                    let statusCode = 200
                    if statusCode == 200 {
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: Notification.Name(rawValue: "EnderecoAdicionado"), object: nil)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "EnderecoAdicionado"), object: nil)
                    }
                }
            }
            
        }
    }
    
    func mudarSenha(senhaAntiga: String, novaSenha: String) {
        
        let url = Singleton.shared.apiEndPoint + "/api/v1/produtor/1/editar-senha"
        let body: Dictionary<String, Any> = ["email": Singleton.shared.comercianteLogado!.email,
                                             "senhaAntiga": senhaAntiga,
                                             "senhaNova": novaSenha
                                            ]
        
        
        if Singleton.shared.comercianteLogado != nil {
            ApiResource.request(method: "PUT", url: url, params: nil, body: body, withAuth: true) { (result, err) in
                if result != nil {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: Notification.Name("SenhaAlterada"), object: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: Notification.Name("ErroAoMudarSenha"), object: nil)
                    }
                }
            }
        }
        
        
//        "email": "jose@redeaoba.com.br",
 //       "senhaAntiga": "abc123",
  //      "senhaNova": "123456"
    }
}
