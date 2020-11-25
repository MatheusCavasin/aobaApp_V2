//
//  Celulas do carrinho.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 21/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit


class SubTotalCarrinhoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var viewBackgroundView: UIView!
    
    override func awakeFromNib() {
        viewBackgroundView.layer.borderWidth = 0.5
        viewBackgroundView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    
    public func config(valor: Float) {
        var total = String(format: "%.2f", valor).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        total = "R$\(total)"
        self.lblSubTotal.text = total
    }
}

class ValorFreteCarrinhoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblFrete: UILabel!
    
    public func config(valor: Float) {
        lblFrete.text = String(format: "%.2f", (valor)).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
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
    
    public func config(endereco: EnderecoData?, navigationController: UINavigationController?) {
        self.navigationController = navigationController
        
        guard endereco != nil else { return }
        self.endereco.text = "\(endereco!.logradouro), \(endereco!.numero)"
        self.cidade.text =  "\(endereco!.cidade) - \(endereco!.uf)"
        
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
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func config(valorTotal: Float) {
        let total = String(format: "%.2f", (valorTotal)).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        
        self.totalDoPedido.text = total
    }
}


class FinalizarPedidoTableViewCell: UITableViewCell {
    @IBOutlet weak var btnFinalizarPedido: UIButton!
    
    
    override func awakeFromNib() {
        self.btnFinalizarPedido.layer.cornerRadius = 5.0
    }
}



class ValorFreteTodosItensTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblFrete: UILabel!
    
    public func config(valor: Float) {
        lblFrete.text = String(format: "%.2f", (valor)).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
    }
}


class ValorTotalTodosItensTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTotal: UILabel!
    
    public func config(valor: Float) {
        lblTotal.text = String(format: "%.2f", (valor)).replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
    }
}

