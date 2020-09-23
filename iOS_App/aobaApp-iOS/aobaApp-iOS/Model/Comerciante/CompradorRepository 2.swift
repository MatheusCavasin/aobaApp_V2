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
                    print(result)
                    let resultDict = result as! Dictionary<String, Any>
                    var statusCode: Int = 0
                        
                    if resultDict["status"] != nil {
                        statusCode = (resultDict["status"] as? Int)!
                    }

                    
                    
                    if statusCode == 0 {
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: Notification.Name(rawValue: "ComercianteCriado"), object: nil)
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
    
}
