//
//  TotalPedidoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 24/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class TotalPedidoTableViewCell: UITableViewCell {
    
    static let identifier = "TotalPedidoTableViewCell"
    @IBOutlet weak var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
    public func config(valor: Float) {
        self.totalLabel.text = String(valor)
    }
}
