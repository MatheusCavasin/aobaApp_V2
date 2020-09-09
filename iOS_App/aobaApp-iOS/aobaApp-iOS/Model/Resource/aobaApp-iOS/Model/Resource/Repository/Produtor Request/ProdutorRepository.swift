//
//  ProdutorRepository.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 31/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class ProdutorRepository {
        
    func create(produtor: Produtor){
        
        //Coloque a URL da sua API aqui
        
        let url = "https://aoba-app-server.herokuapp.com/v1/produtor/create"
        
        let produtorDict = produtor.objectToDictrionary()
        
        //Chamando a funcão POST produtor
        ApiResource.request(method: "POST", url: url, params: nil, body: produtorDict, withAuth: false){
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
    print("ENTROU \n\n\n")}
    
    func getProdutos(){
        print("requestProducts")
        
        //Coloque a URL da sua API aqui
        let url = "https://aoba-api-server.herokuapp.com/api/v1/produto"
        
        //Chamando a funcão GET produtor
        
        /*
        let username = UserDefaults.standard.string(forKey: "Usuario")!
        let password = UserDefaults.standard.string(forKey: "senha")!
        
        let loginString = "\(username):\(password)"
        
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
//        let url = URL(string: "http://192.168.1.2/rest")
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        
        */
        
        
        
        
        
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true){
            (result, err)  in
            //Aqui você tem seu resultado
            if let res:Bool = (err == nil) {
                if(res) {
                    //Aqui res podera assumir dois valores, true ou false
                    print("sua requisicao foi realizada com sucesso")
//                    print(result as! [[String : Any?]])
                    ModelVendedor.instance.dictListaProdutos = result as! [[String : Any?]]
                    print(ModelVendedor.instance.dictListaProdutos[0])
//                    print(ModelVendedor.instance.dictListaProdutos[0]["nome"] as! String)
                 /*   // para pegar a categoria
                    var categoria = ModelVendedor.instance.dictListaProdutos[1]["categoria"] as! [String : Any?]
                    print("\n\n\(categoria["nome"] as! String)") */
                    
                    
                } else {
                    //Aqui voce pode tratar os erros
                    print("a requisicao nao funcionou")
                    print(err)
                }
            }
        }
    }
    
    
    func getAnuncios(){
        print("requestAnuncios")
        
        //Coloque a URL da sua API aqui
        let url = "https://aoba-api-server.herokuapp.com/api/v1/anuncio/produtor/3"
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true){
                    (result, err)  in
                    //Aqui você tem seu resultado
                    if let res:Bool = (err == nil) {
                        if(res) {
                            //Aqui res podera assumir dois valores, true ou false
                            print("sua requisicao foi realizada com sucesso")
                            ModelVendedor.instance.dictListaAnuncios = result as! [[String : Any?]]
                            var a = ModelVendedor.instance.dictListaAnuncios
//                            var b = a[1]["categorias"] as! [[String : Any?]]
                            print("\n\n\n\n\n\n\(a[0])")
                            print("\n\n\n\n\n\n\(a[0]["qtdeMax"] as! Int)")
                            print("\n\n\n\n\n\n\(a[0]["valor"] as! Double)")
                            print("\n\n\n\n\n\n\(a[0]["ativo"] as! Bool)")
                            print("\n\n\n\n\n\n\((a[0]["produto"] as! [String : Any?])["nome"] as! String)")
                            NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationID3"), object: nil)
                        } else {
                            //Aqui voce pode tratar os erros
                            print("a requisicao nao funcionou")
                            print(err)
                        }
                    }
                }
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
