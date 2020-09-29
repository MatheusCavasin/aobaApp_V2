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
    
    public func config(produto: ItemCarrinho){
        self.imageProduto.image = UIImage(named: produto.anuncio.image[0])
        self.nomeProduto.text = produto.nomeProduto

        var value: String = String(format: "%.2f", Float((produto.anuncio.qtdeMax!)) * Float((produto.anuncio.valor)) as CVarArg)
        value = value.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        self.valorProduto.text = "R$ \(value)"
        self.quantidadeProduto.text = "\(produto.anuncio.qtdeMax ?? 0) caixas"
    }
}

class SubTotalCarrinhoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var viewBackgroundView: UIView!
    
    override func awakeFromNib() {
        viewBackgroundView.layer.borderWidth = 0.5
        viewBackgroundView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    
    public func config(carrinho: Carrinho) {
        var total = String(format: "%.2f", carrinho.valorProdutos).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        total = "R$\(total)"
        self.lblSubTotal.text = total
    }
}

class ValorFreteCarrinhoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblFrete: UILabel!
    
    public func config(carrinho: Carrinho) {
        lblFrete.text = String(format: "%.2f", (carrinho.valorEntrega)).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
    }
}

class EnderecoDoCarrinhoTableViewCell: UITableViewCell {

    @IBOutlet weak var viwBackground: UIView!
    @IBOutlet weak var endereco: UILabel!
    @IBOutlet weak var cidade: UILabel!
    
    var navigationController: UINavigationController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viwBackground.layer.borderWidth = 0.5
        viwBackground.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        viwBackground.layer.cornerRadius = 10.0
    }
    
    public func config(carrinho: Carrinho, navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        
        
        if carrinho.endereco != nil {
            self.endereco.text = "\(carrinho.endereco!.logradouro), \(carrinho.endereco!.numero)"
            self.cidade.text =  "\(carrinho.endereco!.cidade) - \(carrinho.endereco!.uf)"
        }
        
    }
}


class DataEntregaTableViewCell: UITableViewCell {
    @IBOutlet weak var lblDataEntrega: UILabel!
    @IBOutlet weak var viewBackgroundView: UIView!
    
    override func awakeFromNib() {
        viewBackgroundView.layer.borderWidth = 0.5
        viewBackgroundView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    
    public func config(dataEntrega: String) {
        lblDataEntrega.text = dataEntrega
    }
}

class TotalDoPedidoTableViewCell: UITableViewCell {

    @IBOutlet weak var totalDoPedido: UILabel!
    @IBOutlet weak var btnFinalizarPEdido: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnFinalizarPEdido.layer.cornerRadius = 5.0
    }
    
    public func config(valorTotal: Float) {
        
        
        let total = String(format: "%.2f", (valorTotal)).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        
        self.totalDoPedido.text = total
    }
}
