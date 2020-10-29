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
    @IBOutlet weak var lblDataEntrega: UILabel!
    @IBOutlet weak var valorProduto: UILabel!
    @IBOutlet weak var quantidadeProduto: UILabel!
    @IBOutlet weak var viewBackgroundView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
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
    
    public func config(produto: ItemData){
        
        let storageRef = Storage.storage().reference(withPath: produto.foto + ".jpg")
        storageRef.getData(maxSize: 4 * 1024 * 1024) { data, error in
            if let _ = error {
                self.loadingIndicator.isHidden = true
                self.imageProduto.image = UIImage(named: "default-image")
                return
            } else {
                self.imageProduto.image = UIImage(data: data!)
            }
        }
        

        self.nomeProduto.text = produto.produtoNome
        
        var value: String = String(format: "%.2f", Float((produto.valor)) * Float((produto.quantidade)) as CVarArg)
        value = value.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        self.valorProduto.text = "R$ \(value)"
        self.quantidadeProduto.text = "\(produto.quantidade) caixas"
        
        
        self.lblDataEntrega.text = "Entrega " + produto.dataEntrega.diaSemana.fullName!
        
    }
    
}
