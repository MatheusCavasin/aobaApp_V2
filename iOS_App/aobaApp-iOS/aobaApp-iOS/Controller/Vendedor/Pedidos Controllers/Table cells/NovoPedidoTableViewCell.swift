//
//  NovoPedidoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by José Guilherme Bestel on 26/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class NovoPedidoTableViewCell: UITableViewCell {
    
    static let identifier = "NovoPedidoTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
