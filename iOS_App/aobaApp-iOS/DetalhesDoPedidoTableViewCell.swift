//
//  DetalhesDoPedidoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 24/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class DetalhesDoPedidoTableViewCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    @IBOutlet var lblMain: UILabel!
    @IBOutlet var lblData: UILabel!
    @IBOutlet var arrowIcon: UIImageView!
    
    
    static func nib() -> UINib {
        return UINib(nibName: "DetalhesDoPedidoTableViewCell", bundle: nil)
    }
    
    static let identifier = "DetalhesDoPedidoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(mainText: String, dataText: String) {
        lblMain.text = mainText
        lblData.text = dataText
        
        backView.layer.cornerRadius = 5.0
        backView.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
        backView.layer.borderWidth = 1.0
        
        let image = UIImage(named: "arrow-icon")?.withTintColor(#colorLiteral(red: 0.7058823529, green: 0.6980392157, blue: 0.6980392157, alpha: 1))
        arrowIcon.image = image
    }
    
}

