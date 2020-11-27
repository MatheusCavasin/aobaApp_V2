//
//  PedidoAndamentoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by José Guilherme Bestel on 24/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PedidoAndamentoTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeComercianteLabel: UILabel!
    
    @IBOutlet weak var realizadoCheckView: UIView!
    @IBOutlet weak var realizadoDateLabel: UILabel!
    
    @IBOutlet weak var confirmadoCheckView: UIView!
    @IBOutlet weak var confirmadoDateLabel: UILabel!
    
    @IBOutlet weak var entregueCheckView: UIView!
    @IBOutlet weak var entregueDateLabel: UILabel!
    
    @IBOutlet weak var contentMainView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var detailsView: UIView!
    
    
    static let identifier = "PedidoAndamentoTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//        bounds = bounds.inset(by: padding)
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(pedidoRespondido : [String : Any?]){
        setupStyle()
        loadInfos(pedidoRespondido: pedidoRespondido)
    }
    
    func loadInfos(pedidoRespondido : [String : Any?]){
        
        let comerciante = pedidoRespondido["comerciante"] as! [String : Any?]
        let nome = comerciante["nomeFantasia"] as! String
        self.nomeComercianteLabel.text = nome
        
        let realizado = pedidoRespondido["dtRealizado"] as? String
        if realizado != nil {
            self.realizadoDateLabel.text = realizado
            self.realizadoCheckView.layer.backgroundColor = #colorLiteral(red: 1, green: 0.5716887116, blue: 0.1306569278, alpha: 1)
        }else{
            self.realizadoCheckView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.realizadoCheckView.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
            self.realizadoCheckView.layer.borderWidth = 1.0
        }
        
        let confirmado = pedidoRespondido["dtConfirmado"] as? String
        if confirmado != nil {
            self.confirmadoDateLabel.text = realizado
            self.confirmadoCheckView.layer.backgroundColor = #colorLiteral(red: 1, green: 0.5716887116, blue: 0.1306569278, alpha: 1)
        }else{
            self.confirmadoCheckView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.confirmadoCheckView.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
            self.confirmadoCheckView.layer.borderWidth = 1.0
        }
        
        let datasEntregas = pedidoRespondido["datasEntrega"] as! [[String : Any?]]
        let entrega = datasEntregas[0]["data"] as? String
        let status = pedidoRespondido["status"] as! String
        if status == "ENTREGUE" {
            self.entregueDateLabel.text = entrega
            self.entregueCheckView.layer.backgroundColor = #colorLiteral(red: 1, green: 0.5716887116, blue: 0.1306569278, alpha: 1)
        }else{
            self.entregueDateLabel.text = "Prazo: \(entrega as! String)"
            self.entregueCheckView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.entregueCheckView.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
            self.entregueCheckView.layer.borderWidth = 1.0
        }
    
    }
    
    
    
    func setupStyle(){
        contentMainView.layer.borderWidth = 1.0
        contentMainView.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
        contentMainView.layer.cornerRadius = 8.0
        
        detailsView.layer.borderWidth = 0.5
        detailsView.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
    }
}
