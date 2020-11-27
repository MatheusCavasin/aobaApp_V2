//
//  ProdutorRepository.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 31/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class ProdutorRepository {
    
    func getPedidosNovos(completion: @escaping (Any?, Error?) -> Void){
        print("request pedidos novos")
        
        guard let produtor = ModelVendedor.instance.produtorLogado else { return }
        let url = "https://aoba-api-server.herokuapp.com/api/v1/pedido/novos/produtor/\(produtor.id)"
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true){
            (result, err) in completion(result, err)
        }
    }
    
    func login(completion: @escaping (Any?, Error?) -> Void ) {
        let url = Singleton.shared.apiEndPoint + "/api/v1/produtor/login"
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true) { (result, err) in
            if let result = result {
                let resultDict = result as! Dictionary<String, Any>
                if resultDict["status"] != nil {
                    let statusCode = resultDict["status"]
                    if statusCode as! Int == 200 {
                        ModelVendedor.instance.produtorLogado = Produtor.dictionaryToObject(dictionary: resultDict)
                        completion(result, nil)
                    } else {
                        completion(nil, nil)
                    }
                } else {
                    ModelVendedor.instance.produtorLogado = Produtor.dictionaryToObject(dictionary: resultDict)
                    completion(result, nil)
                }
            } else {
                completion(nil, err)
            }
        }
    }
    
    func create(produtor: Produtor,
                completion: @escaping (Any?, Error?) -> Void) {
        let url = Singleton.shared.apiEndPoint + "/api/v1/produtor"
        let produtorDict = produtor.objectToDictrionary()
        ApiResource.request(method: "POST", url: url, params: nil, body: produtorDict, withAuth: false){
            (result, err)  in
            if let result = result {
                let resultDict = result as! Dictionary<String, Any>
                if let statusCode = resultDict["status"] {
                    let statusCodeNumber = statusCode as! Int
                    if statusCodeNumber != 200 || statusCodeNumber != 201{
                        completion(nil, nil)
                    }
                } else {
                    completion(result, nil)
                }
            } else {
                completion(nil, err)
            }
        }
        print("ENTROU \n\n\n")
    }
    
    
    
    func getProdutos(){
        print("requestProducts")
        
        //Coloque a URL da sua API aqui
        let url = "https://aoba-api-server.herokuapp.com/api/v1/produto"
        
        //Chamando a funcão GET produtor
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true){
            (result, err)  in
            //Aqui você tem seu resultado
            if let result = result {
                ModelVendedor.instance.dictListaProdutos = result as! [[String : Any?]]
                print(ModelVendedor.instance.dictListaProdutos[0])
            } else {
                
                print("a requisicao nao funcionou")
                print(err)
                
            }
        }
    }
    
    
    
    
    func getCarrinhoVendedor(completion: @escaping (Any?, Error?) -> Void) {
        
        print("request carrinho")
        guard let produtor = ModelVendedor.instance.produtorLogado else { return }
        let url = "https://aoba-api-server.herokuapp.com/api/v1/pedido/respondidos/produtor/\(produtor.id)"
        // dictListaCarrinho
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true){
            (result, err)  in completion(result, err)
        }
        
        /*
         if let res:Bool = (err == nil) {
             if(res) {
                 //Aqui res podera assumir dois valores, true ou false
                 print("sua requisicao foi realizada com sucesso")
                 ModelVendedor.instance.dictListaCarrinho = result as! [[String : Any?]]
                 DispatchQueue.main.async{
//                        NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationID"), object: nil)
//                        print(result)
                     print(ModelVendedor.instance.dictListaCarrinho[0]["valorFrete"])
                 }
                 
             } else {
                 //Aqui voce pode tratar os erros
                 print("a requisicao nao funcionou")
                 print(err)
             }
         }
         
         
         */
        
        
    }
    
    
    func getAnuncios(){
        print("requestAnuncios")
        
        //Coloque a URL da sua API aqui
        guard let produtor = ModelVendedor.instance.produtorLogado else { return }
        let url = "https://aoba-api-server.herokuapp.com/api/v1/anuncio/produtor/\(produtor.id)"
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true){
            (result, err)  in
            //Aqui você tem seu resultado
            if let result = result {
                //Aqui res podera assumir dois valores, true ou false
                print("sua requisicao foi realizada com sucesso")
                
                let novos = result as? [Dictionary<String, Any>]
                if novos == nil {
                    print("Nao há novos pedidos")
                } else {
                    ModelVendedor.instance.dictListaAnuncios = result as! [[String : Any?]]
                }
                
                DispatchQueue.main.async{
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationID"), object: nil)
                }
                
            } else {
                //Aqui voce pode tratar os erros
                print("a requisicao nao funcionou")
                print(err)
            }
            
        }
    }
    
    func criarAnuncio(){
        
        //Coloque a URL da sua API aqui
        
        let url = "https://aoba-api-server.herokuapp.com/api/v1/anuncio"
        let produtorDict = anuncioDictionary()
        
        //Chamando a funcão POST produtor
        ApiResource.request(method: "POST", url: url, params: nil, body: produtorDict, withAuth: true){
            (result, err)  in
            //Aqui você tem seu resultado
            if let result = result  {
                //Aqui res podera assumir dois valores, true ou false
                print("sua requisicao foi realizada com sucesso")
                print(result)
            } else {
                //Aqui voce pode tratar os erros
                print("a requisicao nao funcionou")
                print(err)
            }
            
        }
    }
    
    func editarAnuncio(idAnuncio: Int, qtde: Int, valor: Double){
        
        //Coloque a URL da sua API aqui
        
        let url = "https://aoba-api-server.herokuapp.com/api/v1/anuncio/\(idAnuncio)?qtde=\(qtde)&valor=\(valor)"
        
        //Chamando a funcão PUT produtor
        ApiResource.request(method: "PUT", url: url, params: nil, body: nil, withAuth: true){
            (result, err)  in
            //Aqui você tem seu resultado
            guard result != nil else { return }
            print("A requisiçao funcionou")
            print("https://aoba-api-server.herokuapp.com/api/v1/anuncio/\(idAnuncio)?qtde=\(qtde)&valor=\(valor)")
        }
    }
    
    
    
    
    func deletarAnuncio(idAnuncio: Int){
        
        let url = "https://aoba-api-server.herokuapp.com/api/v1/anuncio/\(idAnuncio)"
        let produtorDict = anuncioDictionary()
        
        //Chamando a funcão POST produtor
        ApiResource.request(method: "DELETE", url: url, params: nil, body: produtorDict, withAuth: true){
            (result, err)  in
            //Aqui você tem seu resultado
            if let result = result {
                //Aqui res podera assumir dois valores, true ou false
                print("sua requisicao foi realizada com sucesso")
                print(result)
            } else {
                //Aqui voce pode tratar os erros
                print("a requisicao nao funcionou")
                print(err)
                
            }
        }
    }
    
    func ativarAnuncio(idAnuncio: Int){
        
        //Coloque a URL da sua API aqui
        
        let url = "https://aoba-api-server.herokuapp.com/api/v1/anuncio/\(idAnuncio)/ativar"
        
        //Chamando a funcão PUT produtor
        ApiResource.request(method: "PUT", url: url, params: nil, body: nil, withAuth: true){
            (result, err)  in
            //Aqui você tem seu resultado
            if let result = result {
                //Aqui res podera assumir dois valores, true ou false
                print("sua requisicao foi realizada com sucesso")
                print(result)
            } else {
                //Aqui voce pode tratar os erros
                print("a requisicao nao funcionou")
                print(err)
            }
        }
//        print("https://aoba-api-server.herokuapp.com/api/v1/anuncio/\(idAnuncio)/ativar")
    }
    
    func desativarAnuncio(idAnuncio: Int){
        
        //Coloque a URL da sua API aqui
        
        let url = "https://aoba-api-server.herokuapp.com/api/v1/anuncio/\(idAnuncio)/desativar"
        
        //Chamando a funcão PUT produtor
        ApiResource.request(method: "PUT", url: url, params: nil, body: nil, withAuth: true){
            (result, err)  in
            //Aqui você tem seu resultado
            if let result = result {
                //Aqui res podera assumir dois valores, true ou false
                print("sua requisicao foi realizada com sucesso")
                print(result)
            } else {
                //Aqui voce pode tratar os erros
                print("a requisicao nao funcionou")
                print(err)
            }
        }
        
        //        print("https://aoba-api-server.herokuapp.com/api/v1/anuncio/\(idAnuncio)/desativar")
    }
    
    
}
/*
 func createProdutor(){
 print("requestProducts")
 
 //Coloque a URL da sua API aqui
 let url = "https://aoba-app-server.herokuapp.com/v1/produtor/create"
 
 let produtor = [
 "email": "ana@aoba.com",
 "senha":"senha123",
 "nome":"Ana Aoba",
 "codigo_registro": "cpf4",
 "foto":"foto_4.png",
 "descricao": "Comerciante de Hortaliças"
 ]
 
 //Chamando a funcão POST produtor
 ApiResource.request(method: "POST", url: url, params: nil, body: produtor){
 (result, err)  in
 //Aqui você tem seu resultado
 if let res:Bool = (err == nil) {
 if(res) {
 //Aqui res podera assumir dois valores, true ou false
 print("sua requisicao foi realizada com sucesso")
 print(result)
 } else {
 //Aqui voce pode tratar os erros
 print("a requisicao nao funcionou")
 print(err)
 }
 }
 }
 }
 */



