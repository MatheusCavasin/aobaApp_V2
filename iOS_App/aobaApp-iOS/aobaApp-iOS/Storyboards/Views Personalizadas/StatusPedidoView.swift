//
//  StatusPedidoView.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation
import UIKit

class StatusDoPedidoView: UIView{
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStatus(status: StatusPedido) {
        if status == .realizado {
            firstDot.fillDot()
        } else if status == .confirmado {
            firstDot.fillDot()
            secondtDot.fillDot()
        } else if status == .entregue {
            firstDot.fillDot()
            secondtDot.fillDot()
            thirdDot.fillDot()
        }
    }
    
    func setDefaultColor(color: UIColor?) {
        firstDot.setDefaultColor(color: color)
        secondtDot.setDefaultColor(color: color)
        thirdDot.setDefaultColor(color: color)
    }
    
    
    
    private func setupUI() {
        self.addSubview(firstDot)
        self.addSubview(secondtDot)
        self.addSubview(thirdDot)
    }

    
    private func setupConstraints() {
        firstDot.translatesAutoresizingMaskIntoConstraints = false
        firstDot.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        firstDot.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        firstDot.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        firstDot.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.33).isActive = true
        
        secondtDot.translatesAutoresizingMaskIntoConstraints = false
        secondtDot.topAnchor.constraint(equalTo: firstDot.bottomAnchor).isActive = true
        secondtDot.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        secondtDot.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        secondtDot.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.33).isActive = true

        thirdDot.translatesAutoresizingMaskIntoConstraints = false
        thirdDot.topAnchor.constraint(equalTo: secondtDot.bottomAnchor).isActive = true
        thirdDot.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        thirdDot.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        thirdDot.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.34).isActive = true
    }
    
    let firstDot: taskView = {
        let fView = taskView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        return fView
    }()
    
    let secondtDot: taskView = {
        let sView = taskView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        return sView
    }()
    
    let thirdDot: taskView = {
        let tView = taskView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        return tView
    }()
    
}



