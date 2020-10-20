//
//  TelefonePerfilViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class TelefonePerfilViewController: UIViewController {

    @IBOutlet weak var txtTelefoneAtual: UITextField!
    @IBOutlet weak var txtNovoTelefone: UITextField!
    @IBOutlet weak var btnCancelar: UIButton!
    @IBOutlet weak var btnAlterar: UIButton!
    @IBOutlet weak var viewLoadView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewLoadView.isHidden = true
    }
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnAlterarPressed(_ sender: Any) {
    }
}
