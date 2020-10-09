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
    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtNomeFantasia: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    @IBOutlet weak var txtCnpj: UITextField!
    
    var comercianteData: ComercianteData!
    let repository = CompradorRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnCadastrar()
        loadingView.isHidden = true
        
        //keyboard
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.logar), name: NSNotification.Name(rawValue: "ComercianteCriado"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.erroAoLogar), name: NSNotification.Name(rawValue: "ErroAoCriarComerciante"), object: nil)
        
        
    }

    
    @objc func erroAoLogar() {
        let alert = UIAlertController(title: "Alerta", message: "Esse usuário já existe", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        loadingView.isHidden = true
    }
    
    @objc func logar() {
        Singleton.shared.loggedIn = true
        Singleton.shared.comercianteLogado = comercianteData
        self.navigationController?.dismiss(animated: true, completion: nil)
        loadingView.isHidden = true
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let height = keyboardSize.height
            self.view.frame.origin.y = -60
            
            
        }
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let height = keyboardSize.height
            self.view.frame.origin.y = 0
            
        }
    }
    func setBtnCadastrar() {
        btnCadastrar.layer.cornerRadius = 5.0
    }
    
    
    @IBAction func btnCadastrarPressed(_ sender: Any) {
        if txtNome.text != "" && txtCnpj.text != "" && txtTelefone.text != "" && txtNomeFantasia.text != "" {

            comercianteData = ComercianteData(cnpj: txtCnpj.text!, email: Singleton.shared.creatingUser[0], senha: Singleton.shared.creatingUser[1], foto: "person.fill", nome: txtNome.text!, telefone: txtTelefone.text! ,nomeFantasia: txtNomeFantasia.text!, rating: 0)
                
    
            repository.create(comerciante: comercianteData)
            loadingView.isHidden = false

        } else {
            let alert = UIAlertController(title: "Alerta", message: "Esses campos são obrigatórios", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
