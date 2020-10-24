//
//  DetalhesView.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation
import UIKit

class DetalhesView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setDefaultColor(color: .blue)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        self.addSubview(detalhesLabel)
        if arrowIcon != nil {
            self.addSubview(arrowIcon!)
        }
    }
    
    func setDefaultColor(color: UIColor) {
        let telOrigImage = UIImage(named: "arrow-icon")
        let tintedImage = telOrigImage?.withRenderingMode(.alwaysTemplate)
        
        if let icon = arrowIcon {
            icon.image = tintedImage
            icon.tintColor = color
        }
    }
    
    func setupConstraints() {
        detalhesLabel.translatesAutoresizingMaskIntoConstraints = false
        detalhesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        detalhesLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        if let icon = arrowIcon {
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            icon.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor, multiplier: 0.6).isActive = true
        }
    }
    
    let detalhesLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        lbl.text = "Detalhes do pedido"
        lbl.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        return lbl
    }()
    
    let arrowIcon: UIImageView? = {
        guard let image = UIImage(named: "arrow-icon") else {
            return nil
        }
        let icon = UIImageView(image: image)
        icon.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        return icon
    }()
}
