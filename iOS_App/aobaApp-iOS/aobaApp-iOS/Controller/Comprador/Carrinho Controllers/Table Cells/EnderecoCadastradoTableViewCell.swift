//
//  EnderecoCadastradoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class EnderecoCadastradoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblRuaNumero: UILabel!
    @IBOutlet weak var lblCidadeUF: UILabel!
    @IBOutlet weak var viewBackgroundView: UIView!
    @IBOutlet weak var viewCirculoExterno: UIView!
    @IBOutlet weak var viewCirculoInterno: UIView!
    
    static let identifier = "EnderecoCadastradoTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "EnderecoCadastradoTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        self.viewCirculoExterno.layer.borderWidth = 1.0
        self.viewCirculoExterno.layer.borderColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        self.viewCirculoExterno.layer.cornerRadius = self.viewCirculoExterno.frame.size.width / 2
        
        self.viewCirculoInterno.layer.cornerRadius = self.viewCirculoInterno.frame.size.width / 2
        
        
        self.viewBackgroundView.layer.cornerRadius = 6.0
        self.viewBackgroundView.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
        self.viewBackgroundView.layer.borderWidth = 1.0
    }
    
    public func fillSelection() {
         self.viewCirculoInterno.layer.backgroundColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
    }
    
    public func config(endereco: EnderecoData) {
        lblRuaNumero.text = "\(endereco.logradouro), \(endereco.numero)"
        lblCidadeUF.text = "\(endereco.cidade) - \(endereco.uf)"
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.viewCirculoInterno.layer.backgroundColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        } else {
            self.viewCirculoInterno.layer.backgroundColor = .none
        }
        
    }
    
    
}
