//
//  ActionsView.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation
import UIKit

class ActionsView: UIView {
    
    public var telButtonCommand: (() -> Void)?
    public var whatsAppButtonCommand: (() -> Void)?
    public var confirmButtonCommand: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        bindUI()
        setupConstraints()
        setDefaultColor(color: .blue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(telButton)
        self.addSubview(whatsAppButton)
        self.addSubview(confirmarButton)
    }
    
    func bindUI() {
        telButton.addTarget(self, action: #selector(self.telButtonPressed), for: .touchDown)
        whatsAppButton.addTarget(self, action: #selector(self.whatsAppButtonPressed), for: .touchDown)
        confirmarButton.addTarget(self, action: #selector(self.confirmButtonPressed), for: .touchDown)
    }
    
    @objc func telButtonPressed() {
        telButtonCommand?()
    }
    @objc func whatsAppButtonPressed() {
        whatsAppButtonCommand?()
    }
    @objc func confirmButtonPressed() {
        confirmButtonCommand?()
    }
    
    func setupConstraints() {
        // Configuracao do botao telefone
        telButton.translatesAutoresizingMaskIntoConstraints = false
        telButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        telButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        telButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.38).isActive = true
        telButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.43).isActive = true
        
        // Configuracao do botao whatsapp
        whatsAppButton.translatesAutoresizingMaskIntoConstraints = false
        whatsAppButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        whatsAppButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        whatsAppButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.38).isActive = true
        whatsAppButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.43).isActive = true
        
        // Configuracao do botao confirmar
        confirmarButton.translatesAutoresizingMaskIntoConstraints = false
        confirmarButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        confirmarButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        confirmarButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        confirmarButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.38).isActive = true
    }
    
    func setDefaultColor(color: UIColor) {
        telButton.setTitleColor(color, for: .normal)
        telButton.layer.borderColor = color.cgColor
        let telOrigImage = UIImage(named: "icone-telefone-verde")
        let tintedImage = telOrigImage?.withRenderingMode(.alwaysTemplate)
        telButton.setImage(tintedImage, for: .normal)
        telButton.tintColor = color
        
        whatsAppButton.setTitleColor(color, for: .normal)
        whatsAppButton.layer.borderColor = color.cgColor
        let whatsOrigImage = UIImage(named: "icon-whatsapp")
        let tintedWhatsImage = whatsOrigImage?.withRenderingMode(.alwaysTemplate)
        whatsAppButton.setImage(tintedWhatsImage, for: .normal)
        whatsAppButton.tintColor = color
        
        confirmarButton.backgroundColor = color
    }
    
    
    let telButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10.0
        btn.layer.borderWidth = 2.0
        btn.setTitle(" Telefone", for: .normal)
        btn.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return btn
    }()
    
    let whatsAppButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10.0
        btn.layer.borderWidth = 2.0
        btn.setTitle(" WhatsApp", for: .normal)
        btn.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return btn
    }()
    
    let confirmarButton: UIButton = {
        let btn = UIButton(type: .system)
       
        btn.setTitle("Confirmar entrega", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        btn.layer.cornerRadius = 10.0
        return btn
    }()
    
}
