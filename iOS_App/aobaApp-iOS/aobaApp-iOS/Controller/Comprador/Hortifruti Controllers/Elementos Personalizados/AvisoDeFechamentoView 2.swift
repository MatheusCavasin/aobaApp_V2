//
//  AvisoDeFechamentoView.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class AvisoDeFechamentoView: UIView {
    override func draw(_ rect: CGRect) {
        
        let label = UILabel(frame: CGRect(x: 0, y: self.frame.size.height/2 - 15, width: self.frame.size.width, height: 30))
        label.text = "Não se esqueça de fechar seu pedido até às 20h"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        
        
        let aspectratio = 100/12
        let screenWidht = UIScreen.main.bounds.width
        
        self.frame.size = CGSize(width: screenWidht, height: screenWidht/CGFloat(aspectratio))
        
        
        self.addSubview(label)
        self.backgroundColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
    }
}

