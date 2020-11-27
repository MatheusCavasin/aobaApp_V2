//
//  PrimeiraTelaDeCadastroViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 13/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PrimeiraTelaDeCadastroViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnProximo: UIButton!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmacaoSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnProximo()


        //keyboard
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        if ((sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            //let height = keyboardSize.height
            self.view.frame.origin.y = -60
            
            
        }
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        if ((sender.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            //let height = keyboardSize.height
            self.view.frame.origin.y = 0
        }
    }
    
    func setBtnProximo() {
        btnProximo.layer.borderWidth = 2.0
        btnProximo.layer.borderColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        btnProximo.layer.cornerRadius = 5.0
    }
    
    @IBAction func btnProximoPressed(_ sender: Any) {
        if email.text != "" && senha.text != "" && confirmacaoSenha.text != ""{
            if senha.text == confirmacaoSenha.text {
                Singleton.shared.creatingUser = []
                Singleton.shared.creatingUser.append(email.text!)
                Singleton.shared.creatingUser.append(senha.text!)
            } else {
                let alert = UIAlertController(title: "Alerta", message: "As senhas não correspondem", preferredStyle: .alert)
                alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Alerta", message: "Esses campos são obrigatórios", preferredStyle: .alert)
            alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
