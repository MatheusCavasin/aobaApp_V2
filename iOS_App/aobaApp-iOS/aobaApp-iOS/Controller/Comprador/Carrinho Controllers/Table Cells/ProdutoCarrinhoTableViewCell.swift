//
//  ProdutoCarrinhoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 15/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class ProdutoCarrinhoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageProduto: UIImageView!
    @IBOutlet weak var nomeProduto: UILabel!
    @IBOutlet weak var valorProduto: UILabel!
    @IBOutlet weak var quantidadeProduto: UILabel!
    
    
    static let identifier = "ProdutoCarrinhoTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ProdutoCarrinhoTableViewCell",
                     bundle: nil)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageProduto.layer.cornerRadius = 5.0
    }
    
    public func config(produto: AtivosProduto){
        self.imageProduto.image = UIImage(named: "logo.png")
        self.nomeProduto.text = produto.nome
        
        var value: String = String(format: "%.2f", Float((produto.anuncios[0].qtdeMax!)) * Float((produto.anuncios[0].valor)) as CVarArg)
        value = value.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        self.valorProduto.text = "R$ \(value)"
        self.quantidadeProduto.text = "\(produto.anuncios[0].qtdeMax ?? 0) caixas"
    }
    
}
