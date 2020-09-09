//
//  DiasDaSemana.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 09/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class DiaDaSemanaView: UIView {
    
    var identifier: String?
    var controller: MenuViewController!
    
    override init (frame : CGRect) {
        super.init(frame : frame)
    }
    
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        let hortifrutiViewController: HortifrutiViewController!
        let hortifrutiView = UIStoryboard(name: "TabHortifrutiComprador", bundle: nil)
        
        hortifrutiViewController = hortifrutiView.instantiateViewController(identifier:
            "hortifruti") as? HortifrutiViewController
    
        
        controller.navigationController?.show(hortifrutiViewController, sender: controller)
        hortifrutiViewController.navigationItem.title = identifier
        hortifrutiViewController.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setupView(_ identifier: String, presentingController: MenuViewController) {
        self.layer.cornerRadius = 10
        self.identifier = identifier
        
        self.controller = presentingController
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(_:)))
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    
}
