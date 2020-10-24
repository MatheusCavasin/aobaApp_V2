//
//  AvaliarPedidosTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class AvaliarPedidosTableViewCell: UITableViewCell {

    @IBOutlet weak var lblVer: UILabel!
    @IBOutlet weak var imgArrow: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    
    static let identifier = "AvaliarPedidosTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "AvaliarPedidosTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func config(text: String, color: UIColor) {
        lblVer.text = text
        
        let image = UIImage(named: "arrow-icon")
        let tintedImage = image?.withTintColor(.white)
        imgArrow.image = tintedImage
        
        backView.backgroundColor = color
        backView.layer.cornerRadius = 5.0
    }
}

