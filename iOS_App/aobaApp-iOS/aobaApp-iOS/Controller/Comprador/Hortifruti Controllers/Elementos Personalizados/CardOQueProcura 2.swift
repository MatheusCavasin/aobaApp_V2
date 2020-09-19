//
//  ImagemArredondada.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 09/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class CardOQueProcura: UIImageView {
    
    
    var identifier: String?
    var controller: MenuViewController!
    
    
    private func roundBorder() {
        self.layer.cornerRadius = 6
    }
    
    func setupView(_ identifier: String, presentingController: MenuViewController) {
        roundBorder()
        
        self.identifier = identifier
        self.controller = presentingController

        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(_:)))
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        let hortifrutiViewController: HortifrutiViewController!
        let hortifrutiView = UIStoryboard(name: "TabHortifrutiComprador", bundle: nil)
        
        hortifrutiViewController = hortifrutiView.instantiateViewController(identifier:
            "hortifruti") as? HortifrutiViewController
    
        
        controller.navigationController?.show(hortifrutiViewController, sender: controller)
        hortifrutiViewController.navigationItem.title = identifier
        hortifrutiViewController.navigationController?.navigationBar.prefersLargeTitles = true
        hortifrutiViewController.modoDeApresetacao = ModoDeApresentacao.diasDaSemana
        hortifrutiViewController.nomeDaSecaoFVL = identifier
    }
}
