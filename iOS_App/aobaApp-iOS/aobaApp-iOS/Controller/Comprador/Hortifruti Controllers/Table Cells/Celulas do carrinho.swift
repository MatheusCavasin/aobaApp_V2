//
//  Celulas do carrinho.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 21/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class ProdutoDoCarrinhoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageProduto: UIImageView!
    @IBOutlet weak var nomeProduto: UILabel!
    @IBOutlet weak var valorProduto: UILabel!
    @IBOutlet weak var quantidadeProduto: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageProduto.layer.cornerRadius = 5.0
    }
    
    public func config(produto: Dictionary<String, Any>){
        self.imageProduto.image = UIImage(named: produto["imagem"] as! String)
        self.nomeProduto.text = produto["titulo"] as? String

        var value: String = String(format: "%.2f", Float((produto["quantidade"] as! Int)) * Float((produto["preco"] as! Double)) as CVarArg)
        value = value.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        self.valorProduto.text = "R$ \(value)"
        self.quantidadeProduto.text = "\(produto["quantidade"] ?? "--") caixas"
    }
}

class EnderecoDoCarrinhoTableViewCell: UITableViewCell {

    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var viwBackground: UIView!
    @IBOutlet weak var endereco: UILabel!
    @IBOutlet weak var cidade: UILabel!
    @IBOutlet weak var valorDoFrete: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viwBackground.layer.borderWidth = 0.5
        viwBackground.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        viwBackground.layer.cornerRadius = 10.0
    }
    
    public func config(carrinho: Dictionary<String, Any>) {

        let produtos = carrinho["produtos"] as! [Dictionary<String, Any>]
        let total = String(format: "%.2f", calculateTotal(produtos: produtos)).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        
        self.subTotal.text = total
        self.endereco.text = carrinho["endereco"] as? String
        self.cidade.text = carrinho["cidade"] as? String
        self.valorDoFrete.text = String(format: "%.2f", (Float(carrinho["valorFrete"] as! Double))).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
    }
    
    private func calculateTotal(produtos: [Dictionary<String, Any>]) -> Float {
        var total: Float = 0.0
        var valor: Float = 0.0
        
        for produto in produtos {
            valor = Float(produto["quantidade"] as! Int) * Float(produto["preco"] as! Double)
            total = total + valor
        }
        return total
    }
}

class TotalDoPedidoTableViewCell: UITableViewCell {

    @IBOutlet weak var totalDoPedido: UILabel!
    @IBOutlet weak var btnFinalizarPEdido: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func config(carrinho: Dictionary<String, Any>) {
        
        
        let produtos = carrinho["produtos"] as! [Dictionary<String, Any>]
        let total = String(format: "%.2f", (calculateTotal(produtos: produtos) + Float(carrinho["valorFrete"] as! Double))).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        
        self.totalDoPedido.text = total
    }
    
    private func calculateTotal(produtos: [Dictionary<String, Any>]) -> Float {
        var total: Float = 0.0
        var valor: Float = 0.0
        
        for produto in produtos {
            valor = Float(produto["quantidade"] as! Int) * Float(produto["preco"] as! Double)
            total = total + valor
        }
        return total
    }

}
