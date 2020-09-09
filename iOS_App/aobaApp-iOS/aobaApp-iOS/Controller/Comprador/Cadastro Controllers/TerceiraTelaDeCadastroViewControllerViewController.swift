//
//  TerceiraTelaDeCadastroViewControllerViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 13/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class TerceiraTelaDeCadastroViewControllerViewController: UIViewController {

    @IBOutlet weak var btnCadastrar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnCadastrar()
     
    }

    func setBtnCadastrar() {
        btnCadastrar.layer.cornerRadius = 5.0
    }
    
}
