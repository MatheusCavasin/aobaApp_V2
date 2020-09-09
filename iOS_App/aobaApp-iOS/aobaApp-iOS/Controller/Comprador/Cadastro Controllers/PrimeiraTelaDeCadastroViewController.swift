//
//  PrimeiraTelaDeCadastroViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 13/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PrimeiraTelaDeCadastroViewController: UIViewController {

    @IBOutlet weak var btnProximo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnProximo()
    }
    
    func setBtnProximo() {
        btnProximo.layer.borderWidth = 2.0
        btnProximo.layer.borderColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        btnProximo.layer.cornerRadius = 5.0
    }
    
}
