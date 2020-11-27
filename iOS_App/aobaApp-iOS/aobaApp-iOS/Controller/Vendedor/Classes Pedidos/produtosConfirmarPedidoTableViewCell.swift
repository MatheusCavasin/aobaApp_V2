//
//  produtosConfirmarPedidoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 27/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class produtosConfirmarPedidoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeProduto: UILabel!
    @IBOutlet weak var qtdeCaixas: UILabel!
    @IBOutlet weak var precoTotal: UILabel!
    
    static let identifier = "produtosConfirmarPedidoTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: identifier,
                     bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func configVendedor(iten: [String : Any?]){
        
//        var valor = iten["valor"] as! Double
//        var formato = NumberFormatter()
//        formato.usesGroupingSeparator = true
//        formato.numberStyle = .currency
//        formato.locale = Locale.current
//        let valorString = formato.string(from: NSNumber(value: valor))!
        
        self.nomeProduto.text = iten["item"] as? String
        self.qtdeCaixas.text = String("\((iten["quantidade"] as? Int)!) caixas")
        self.precoTotal.text = String((iten["valor"] as? Float)!) // prazoResposta
        
    }
    
}
