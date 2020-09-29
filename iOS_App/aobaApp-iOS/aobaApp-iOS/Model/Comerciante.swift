//
//  Comerciante.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 04/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation



class Comerciante: User {
    
    var tipoComercio: TipoComercio
    var endereco: Endereco
    
    init(email: String, senha: String, nome: String, foto: String, tipoComercio: TipoComercio, endereco: Endereco){
        self.tipoComercio = tipoComercio
        self.endereco = endereco
        super.init(email: email, senha: senha, nome: nome, foto: foto)
    }
}


// MARK: Funcao para pegar imagem do firebase
/*

import Firebase

 colocar dentro de um for
 
let storageRef = Storage.storage().reference(withPath: "Aqui vai o id da foto que voce vai pegar do array de fotos do back")
storageRef.getData(maxSize: 4 * 1024 * 1024) { (data, error) in
    if let error == error {
        print("Erro no download: \(error.localizedDescription)")
        return
    }
    if data == data {
        variavel da imagemView que voce quer coloca-la = UIImage(data: data)
    }
    
}
 
 end funcao for
*/
