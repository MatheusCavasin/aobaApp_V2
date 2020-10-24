//
//  TaskView.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation
import UIKit

class taskView: UIView {
    var defaultColor: UIColor?
    
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
        self.addSubview(dot)
        self.addSubview(dataLabel)
        self.addSubview(mainLabel)
    }
    
    func setupConstraints() {
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dot.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        dot.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        dot.widthAnchor.constraint(equalTo: dot.heightAnchor).isActive = true
        
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.leftAnchor.constraint(equalTo: dot.rightAnchor, constant: 10).isActive = true
        mainLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20).isActive = true
        mainLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.leftAnchor.constraint(equalTo: dot.rightAnchor, constant: 10).isActive = true
        dataLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20).isActive = true
        dataLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 1).isActive = true
    }
    
    func fillDot() {
        if let color = defaultColor {
            self.dot.backgroundColor = color
        } else {
            self.dot.backgroundColor = .blue
        }
        
        self.dot.layer.borderWidth = 0.0
    }
    
    func setDefaultColor(color: UIColor?) {
        
        if let color = color {
            mainLabel.textColor = color
            defaultColor = color
        } else {
            mainLabel.textColor = .blue
            defaultColor = .blue
        }   
    }
    
    func setTextMainLabel(text: String) {
        self.mainLabel.text = text
    }
    
    func setTextDataLabel(text: String) {
        self.dataLabel.text = text
    }
    
    fileprivate let dot: UIView = {
        let d = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        d.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        d.layer.cornerRadius = d.frame.width / 2
        d.layer.borderWidth = 1.0
        return d
    }()
    
    fileprivate let mainLabel: UILabel = {
        let mLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 10))
        mLabel.font = UIFont(name: "Helvetica-medium", size: 13)
        mLabel.text = "Confirmado"
        return mLabel
    }()
    
    fileprivate let dataLabel: UILabel = {
        let dLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 10))
        dLabel.font = UIFont(name: "Helvetica", size: 13)
        dLabel.textColor = #colorLiteral(red: 0.6235294118, green: 0.6235294118, blue: 0.6235294118, alpha: 1)
        dLabel.text = "Salve salve"
        return dLabel
    }()
}



