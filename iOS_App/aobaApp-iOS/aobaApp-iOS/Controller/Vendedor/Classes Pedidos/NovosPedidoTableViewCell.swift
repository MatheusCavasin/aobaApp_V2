//
//  NovosPedidoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 26/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class NovosPedidoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeFantasia: UILabel!
    @IBOutlet weak var nomeComprador: UILabel!
    @IBOutlet weak var tempoRestante: UILabel!
    
    
    
    static let identifier = "NovosPedidoTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "NovosPedidoTableViewCell",
                     bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configVendedor(produto: [String : Any?]){
        self.nomeFantasia.text = produto["nomeFantasiaComerciante"] as? String
        self.nomeComprador.text = produto["nomeComerciante"] as? String
        self.tempoRestante.text = "5h restantes" // prazoResposta
    }
}


class confirmarPedidoCell: UITableViewCell {
    

    @IBOutlet weak var aceitarPedido: UIButton!
    @IBOutlet weak var recusarPedido: UIButton!
    weak var delegate: CellsAnuncioDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        aceitarPedido.layer.cornerRadius = ButtonConfig.raioBorda
        recusarPedido.layer.cornerRadius = ButtonConfig.raioBorda
        recusarPedido.layer.borderWidth = ButtonConfig.larguraBorda
        recusarPedido.layer.borderColor = ButtonConfig.laranja
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func recusarPedidoButton(_ sender: Any) {
        delegate?.recusarPedidoPressed()
        print("Recusar pedido pressionado")
    }
    
    @IBAction func aceitarPedidoButton(_ sender: Any) {
        delegate?.aceitarPedidoPressed()
        print("Aceitar pedido pressionado")
    }
    
    
    
}

protocol CellsAnuncioDelegate: class {
    func recusarPedidoPressed()
    func aceitarPedidoPressed()
}
