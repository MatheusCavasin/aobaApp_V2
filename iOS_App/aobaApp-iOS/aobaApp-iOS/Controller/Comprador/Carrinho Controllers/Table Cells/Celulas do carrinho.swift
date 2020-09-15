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
    
    public func config(produto: AtivosProduto){
        self.imageProduto.image = UIImage(named: "logo.png")
        self.nomeProduto.text = produto.nome

        var value: String = String(format: "%.2f", Float((produto.anuncio.qtdeMax!)) * Float((produto.anuncio.valor)) as CVarArg)
        value = value.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        self.valorProduto.text = "R$ \(value)"
        self.quantidadeProduto.text = "\(produto.anuncio.qtdeMax ?? 0) caixas"
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
    
    public func config(carrinho: [AtivosProduto]) {

        let total = String(format: "%.2f", calculateTotal(produtos: carrinho)).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        
        self.subTotal.text = total
        
        self.cidade.text =  "Taubate-SP"
        self.valorDoFrete.text = String(format: "%.2f", (Float(30.0))).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
    }
    
    private func calculateTotal(produtos: [AtivosProduto]) -> Float {
        var total: Float = 0.0
        var valor: Float = 0.0
        
        for produto in produtos {
            valor = Float(produto.anuncio.qtdeMax) * produto.anuncio.valor
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
    
    public func config(carrinho: [AtivosProduto]) {
        
        
        let total = String(format: "%.2f", (calculateTotal(produtos: carrinho) + Float(30.0))).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        
        self.totalDoPedido.text = total
    }
    
    private func calculateTotal(produtos: [AtivosProduto]) -> Float {
        var total: Float = 0.0
        var valor: Float = 0.0
        
        for produto in produtos {
            valor = Float(produto.anuncio.qtdeMax) * produto.anuncio.valor
            total = total + valor
        }
        return total
    }

}
