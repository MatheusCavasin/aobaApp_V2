//
//  AvaliarPedidosTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class AvaliarPedidosTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configStyle(color: UIColor) {
        
        let backView: UIView = {
            let view = UIView()
            self.layer.cornerRadius = 10.0
    
            return view
        }()
        
        let label: UILabel = {
            let lbl = UILabel()
            lbl.text = "Avalie seus pedidos"
            lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
            return lbl
        }()
        
        let arrow: UIImageView = {
            let image = UIImage(named: "icon-arrow")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            imageView.tintColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
            return imageView
        }()
        
        
        self.addSubview(label)
        self.addSubview(arrow)
        self.addSubview(backView)
    
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        backView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        backView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -20).isActive = true
        backView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive  = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15).isActive = true
        label.centerYAnchor.constraint(equalTo: backView.centerYAnchor).isActive = true
        
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20).isActive = true
        arrow.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        arrow.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        arrow.widthAnchor.constraint(equalTo: arrow.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    
    

}
