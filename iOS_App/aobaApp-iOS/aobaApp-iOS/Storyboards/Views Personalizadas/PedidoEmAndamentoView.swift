//
//  PedidoEmAndamentoView.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PedidoEmAndamentoView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
        self.layer.borderWidth = 1.0
        
        self.addSubview(headerView)
        self.addSubview(mediumView)
        self.addSubview(bottonView)
    }
    
    func setDefaultColor(color: UIColor?) {
        mediumView.setDefaultColor(color: color)
        headerView.setDefaultColor(color: color!)
        bottonView.setDefaultColor(color: color!)
    }

    
    func setStatus(status: StatusPedido) {
        mediumView.setStatus(status: status)
    }
    
    func setMainTexts(firstField: String, secondField: String, thirdField: String) {
        mediumView.firstDot.setTextMainLabel(text: firstField)
        mediumView.secondtDot.setTextMainLabel(text: secondField)
        mediumView.thirdDot.setTextMainLabel(text: thirdField)
    }
    
    func setDataText(firstField: String, secondField: String, thirdField: String) {
        mediumView.firstDot.setTextDataLabel(text: firstField)
        mediumView.secondtDot.setTextDataLabel(text: secondField)
        mediumView.thirdDot.setTextDataLabel(text: thirdField)
    }
    
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Configuração das constraints da headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.185).isActive = true
        
        // Configuração das constraints da mediumView
        mediumView.translatesAutoresizingMaskIntoConstraints = false
        mediumView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20).isActive = true
        mediumView.bottomAnchor.constraint(equalTo: bottonView.topAnchor, constant: -20).isActive = true
        mediumView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        mediumView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true

        // Configuração das constraints da bottomView
        bottonView.translatesAutoresizingMaskIntoConstraints = false
        bottonView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottonView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bottonView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottonView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
    }
    
    fileprivate let headerView: DetalhesView = {
        let hView = DetalhesView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        hView.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
        hView.layer.borderWidth = 1.0
        hView.roundTopSide(radius: 10.0)
        
        return hView
    }()
    
    let bottonView: ActionsView = {
        let bView = ActionsView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        return bView
    }()
    
    fileprivate let mediumView: StatusDoPedidoView = {
        let mView = StatusDoPedidoView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        return mView
    }()
}


extension UIView {
    func roundTopSide(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
