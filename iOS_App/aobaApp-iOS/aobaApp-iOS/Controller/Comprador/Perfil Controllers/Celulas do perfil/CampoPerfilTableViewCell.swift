//
//  CampoPerfilTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 09/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class CampoPerfilTableViewCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

    static let identifier = "PerfilViewController"
    
    public func config(systemImageName: String, title: String) {
        self.imgIcon.image = UIImage(systemName: systemImageName)
        self.imgIcon.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        self.lblTitle.text = title
    }
}
