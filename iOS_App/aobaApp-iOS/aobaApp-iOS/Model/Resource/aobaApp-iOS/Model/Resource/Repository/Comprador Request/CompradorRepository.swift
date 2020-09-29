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
        
        //Coloque a URL da sua API aqui
        
        let url  = Singleton.shared.apiEndPoint + "/api/v1/comerciante"
        
        var comercianteDict = comerciante.objectToDictrionary()
        
       //var enderecosBody = comercianteDict["enderecos"] as! [Dictionary<String, Any>]
        
       // if let theJSONData = try? JSONSerialization.data(
       //     withJSONObject: enderecosBody,
       //     options: []) {
       //     let theJSONText = String(data: theJSONData,
       //                                encoding: .ascii)
       //     print("JSON string = \(theJSONText!)")
       //
       //     comercianteDict["enderecos"] = theJSONText
       // }
        

        
        
        
        
        //Chamando a funcão POST produtor
        ApiResource.request(method: "POST", url: url, params: nil, body: comercianteDict, withAuth: false){
            (result, err)  in
            //Aqui você tem seu resultado
            if let res:Bool = (err == nil) {
                if(res) {
                    //Aqui res podera assumir dois valores, true ou false
                    print("sua requisicao foi realizada com sucesso")
                    
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
                    //Aqui voce pode tratar os erros
                    print(err)
                }
            }
        }
        print("ENTROU \n\n\n")}
    
    
    
    func login() {
        let url  = Singleton.shared.apiEndPoint + "/api/v1/comerciante/login"
        
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true) { (result, err) in
            
            if let res:Bool = (err == nil) {
                if(res) {
                    print("sua requisicao foi realizada com sucesso")
                    print(result)
                    
                    
                    let resultDict = result as! Dictionary<String, Any>
                    var statusCode: Int = 200
                        
                    if resultDict["status"] != nil {
                        statusCode = (resultDict["status"] as? Int)!
                    }

                    
                    if statusCode == 200 {
                        DispatchQueue.main.async {
                            Singleton.shared.comercianteLogado = ComercianteData.dictToObject(dict: result as! Dictionary<String, Any>)
                            
                            print(Singleton.shared.comercianteLogado?.id)
                            
                            NotificationCenter.default.post(name: Notification.Name(rawValue: "SucessoAoLogar"), object: nil)
                        }
                    }
                    
                    else {
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: Notification.Name(rawValue: "ErroAoLogar"), object: nil)
                        }
                    }
                }
                
                else {
                    print(err)
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "ErroAoLogar"), object: nil)
                    }
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
                if let res:Bool = (err == nil) {
                    if (res) {
                        print("Sucesso")
                        
                        /*
                         let resultDict = result as! Dictionary<String, Any>
                         var statusCode: Int = 200
                         
                         if resultDict["status"] != nil {
                         statusCode = (resultDict["statas"] as? Int)!
                         }
                         */
                        let statusCode = 200
                        if statusCode == 200 {
                            DispatchQueue.main.async {
                                NotificationCenter.default.post(name: Notification.Name(rawValue: "EnderecoAdicionado"), object: nil)
                            }
                        }
                    } else {
                        print(err)
                    }
                }
            }
        }
    }
    
    
}
