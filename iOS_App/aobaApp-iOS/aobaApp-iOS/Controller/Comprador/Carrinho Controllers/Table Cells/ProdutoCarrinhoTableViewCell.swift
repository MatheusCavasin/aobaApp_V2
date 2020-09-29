//
//  ProdutoCarrinhoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 15/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit
import Firebase

class ProdutoCarrinhoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageProduto: UIImageView!
    @IBOutlet weak var nomeProduto: UILabel!
    @IBOutlet weak var valorProduto: UILabel!
    @IBOutlet weak var quantidadeProduto: UILabel!
    @IBOutlet weak var viewBackgroundView: UIView!
    
    static let identifier = "ProdutoCarrinhoTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ProdutoCarrinhoTableViewCell",
                     bundle: nil)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageProduto.layer.cornerRadius = 5.0
        
        viewBackgroundView.layer.borderWidth = 0.5
        viewBackgroundView.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
    
    public func config(produto: ItemCarrinho){
        
        let storageRef = Storage.storage().reference(withPath: produto.anuncio.image[0])
        storageRef.getData(maxSize: 4 * 1024 * 1024) { data, error in
            if let error = error {
                print("Erro no download: \(error.localizedDescription)")
                return
            } else {
                self.imageProduto.image = UIImage(data: data!)
            }
        }
        
    
        self.nomeProduto.text = produto.nomeProduto
        
        var value: String = String(format: "%.2f", Float((produto.anuncio.qtdeMax!)) * Float((produto.anuncio.valor)) as CVarArg)
        value = value.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        self.valorProduto.text = "R$ \(value)"
        self.quantidadeProduto.text = "\(produto.anuncio.qtdeMax ?? 0) caixas"
    }
    
}
