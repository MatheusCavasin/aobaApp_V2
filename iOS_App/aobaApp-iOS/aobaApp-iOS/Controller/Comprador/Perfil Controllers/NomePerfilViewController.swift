//
//  NomePerfilViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class NomePerfilViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var btnCancelar: UIButton!
    @IBOutlet weak var btnAlterar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNome.text = Singleton.shared.comercianteLogado?.nome
    }

    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnAlterarPressed(_ sender: Any) {
    }
}
