//
//  ProdutoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class ProdutoTableViewCell: UITableViewCell {
    @IBOutlet weak var contorno: UIView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var preco: UILabel!
    @IBOutlet weak var avalicaoDoProdutor: UILabel!
    @IBOutlet weak var quantidadeDisponivel: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    
    
    
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
      
    
    func config(produto: Dictionary<String, Any>) {
        titulo.text = produto["titulo"] as? String
        
        // Se não achar a imagem, mostra o logo
        imagem.image = UIImage(named: produto["imagem"] as? String ?? "logo") ?? UIImage(named: "logo")

        //Ajusta para as casas decimais e troca o ponto por virgula
        var precoStr: String = String(format: "%.2f", produto["preco"] as! CVarArg)
        precoStr = precoStr.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        preco.text = "R$ \(precoStr) caixa"
        
        quantidadeDisponivel.text = "\(produto["quantidadeDisponiel"] ?? "---") + caixas disponíveis"
        avalicaoDoProdutor.text = "\(produto["avaliação do produtor"]!)"
    }
    
    
}



