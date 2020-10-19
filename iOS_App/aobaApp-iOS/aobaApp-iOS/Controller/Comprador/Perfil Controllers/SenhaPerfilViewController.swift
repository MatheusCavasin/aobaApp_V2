//
//  SenhaPerfilViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class SenhaPerfilViewController: UIViewController {

    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtNovaSenha: UITextField!
    @IBOutlet weak var txtConfirmacaoSenha: UITextField!
    @IBOutlet weak var btnCancelar: UIButton!
    @IBOutlet weak var btnAlterar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnAlterarPressed(_ sender: Any) {
        if txtNovaSenha.text != txtConfirmacaoSenha.text {
            let alert = UIAlertController(title: "Senhas não correspondem", message: "Para fazer a alteração de senha, preencha corretamente todos os campos", preferredStyle: .alert)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
