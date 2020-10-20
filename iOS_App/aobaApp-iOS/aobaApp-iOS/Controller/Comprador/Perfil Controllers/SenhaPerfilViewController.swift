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
    @IBOutlet weak var viewLoadView: UIView!
    
    
    
    let repository = CompradorRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoadView.isHidden = true
        
        //Observables
        NotificationCenter.default.addObserver(self, selector: #selector(self.apresentarSucesso), name: NSNotification.Name(rawValue: "SenhaAlterada"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.apresentarErro), name: NSNotification.Name(rawValue: "ErroAoMudarSenha"), object: nil)
    }
    
    @objc func apresentarSucesso() {
        viewLoadView.isHidden = true
        self.showAlertView(title: "Tudo certo!", message: "Sua senha foi alterada com sucesso", buttonTexts: ["Ok"])
    }
    
    @objc func apresentarErro() {
        viewLoadView.isHidden = true
        self.showAlertView(title: "Erro", message: "A senha não pode ser alterada no momento", buttonTexts: ["Ok", "Cancelar"])
    }
    
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnAlterarPressed(_ sender: Any) {
        if txtNovaSenha.text != txtConfirmacaoSenha.text {
            self.showAlertView(title: "Senhas não correspondem", message: "Para fazer a alteração de senha, preencha corretamente todos os campos", buttonTexts: ["Ok", "Cancelar"])
        } else if txtSenha.text == "" || txtNovaSenha.text == "" || txtConfirmacaoSenha.text == "" {
            self.showAlertView(title: "Erro ao tentar mudar senha", message: "Para fazer a alteração de senha, preencha corretamente todos os campos", buttonTexts: ["Ok"])
        } else {
            repository.mudarSenha(senhaAntiga: txtSenha.text!, novaSenha: txtNovaSenha.text!)
            viewLoadView.isHidden = false
            // Caso sucesso, apresentar sucesso
            // Caso erro, apresentar Erro
        }
    }
    
    
    
    
    private func showAlertView(title: String, message: String, buttonTexts: [String]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for buttonText in buttonTexts {
            alert.addAction(UIAlertAction(title: NSLocalizedString(buttonText, comment: buttonText), style: .default, handler: { _ in
                // Nao faz nada
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
}
