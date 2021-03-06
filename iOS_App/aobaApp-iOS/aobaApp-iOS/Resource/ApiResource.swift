//
//  ApiResource.swift
//  aobaApp-iOS
//
//  Created by José Guilherme Bestel on 20/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation
class ApiResource{
    
    
    
    
    //Não esqueca de importar o Foundation
    static func request(method: String, url: String, params: [String: Any]?, body: [String: Any]?, withAuth: Bool,
                     completion: @escaping (Any?, Error?) -> Void){

        print("entrou em request")
        //URL válida
        guard let URL = URL(string: url) else {
            completion(nil, nil)
            return
        }
        
        //Cria a representacão da requisição
        let request = NSMutableURLRequest(url: URL)
        //Atribui à requisiçāo o método parassado como parâmetro
        request.httpMethod = method.uppercased()
        
        if withAuth {
            
            //Set das variáveis utilizadas na Basic Authentication
            let username = UserDefaults.standard.string(forKey: "Usuario")!
            let password = UserDefaults.standard.string(forKey: "senha")!
            let loginString = "\(username):\(password)"
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            
            
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        }
        
        
        //Se houver parâmetros para enviar na URL
        if params != nil{
            //Converte as chaves em String no formato de parâmetro
            let requestParams = params!.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
            print(requestParams)
            print("\(url)?\(requestParams)")
            
            //Atribui nova URL na requsição com os parâmetros
            request.url = Foundation.URL(string: "\(url)?\(requestParams)")
        }
        
        //Se tiver body para enviar à requisição
        if body != nil{
            //Transforma o dicionario em String no formato JSON
            var requestBody = body!.map { "\"\($0.0)\":\"\($0.1)\""}.joined(separator: ", ")
            requestBody = "{\(requestBody)}"
            
            //Atribui o corpo à requisição
            request.httpBody = requestBody.data(using: String.Encoding.utf8)
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
            
            print(requestBody)
        }

        //Cria a tarefa de requisição
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                }
                
                if let data = data {
                    //A resposta chegou
                    print("RequestApi.request: A resposta chegou")
                    let response = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(response, nil)
                }
                else {
                    print("RequestApi.request: Não houve resposta")
                    //Não houve resposta
                    completion(nil, nil)
                }
            } catch let error as NSError {
                //Houve um erro na comunicao com o servidor
                print("RequestApi.request: Não houve resposta")
                completion(nil, error)
            }
        }
        
        
        //Aciona a tarefa
        task.resume()
    }
}

/*
 EXEMPLOS
 
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
 
 func requestProdutor(){
     print("requestProducts")
     
     //Coloque a URL da sua API aqui
     let url = "https://aoba-app-server.herokuapp.com/v1/produtor/get/id/cpf2"
     
     //Chamando a funcão GET produtor
     
     ApiResource.request(method: "GET", url: url, params: nil, body: nil){
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
