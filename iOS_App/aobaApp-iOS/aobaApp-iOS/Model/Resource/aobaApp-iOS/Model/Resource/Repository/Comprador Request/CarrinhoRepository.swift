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
    func getCarrinhoVendedor(completion: @escaping (Any?, Error?) -> Void) {
        
        print("request carrinho")
        
        let url = "https://aoba-api-server.herokuapp.com/api/v1/pedido/respondidos/produtor/3"
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: true){
            (result, err)  in completion(result, err)
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
}
