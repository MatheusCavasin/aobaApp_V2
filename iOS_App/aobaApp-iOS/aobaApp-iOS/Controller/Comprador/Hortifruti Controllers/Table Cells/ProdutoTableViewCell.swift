//
//  ProdutoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit
import Firebase


class ProdutoTableViewCell: UITableViewCell {
    @IBOutlet weak var contorno: UIView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var preco: UILabel!
    @IBOutlet weak var avalicaoDoProdutor: UILabel!
    @IBOutlet weak var quantidadeDisponivel: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    
    static let identifier = "ProdutoTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ProdutoTableViewCell",
                     bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Configuração do contorno
        contorno.layer.borderWidth = 1.0
        contorno.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        contorno.layer.cornerRadius = 10.0
        
        // Configuracao da imagem
        imagem.clipsToBounds = true
        imagem.layer.cornerRadius = 10
        imagem.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
      
    
    func config(nomeProduto:String ,anuncio: AtivosAnuncio) {
        titulo.text = nomeProduto
        
        
        let storageRef = Storage.storage().reference(withPath: anuncio.image[0] + ".jpg")
        storageRef.getData(maxSize: 4 * 1024 * 1024) { data, error in
            if let error = error {
                self.loadingIndicator.isHidden = true
                self.imagem.image = UIImage(named: "default-image")
                return
            } else {
                self.imagem.image = UIImage(data: data!)
            }
        }
        
    

        //Ajusta para as casas decimais e troca o ponto por virgula
        var precoStr: String = String(format: "%.2f", anuncio.valor!)
        precoStr = precoStr.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        preco.text = "R$ \(precoStr) caixa"
        
        quantidadeDisponivel.text = "\(anuncio.qtdeMax!) caixas disponíveis"
        avalicaoDoProdutor.text = "\(5.0)"
    }
    
    
}





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
