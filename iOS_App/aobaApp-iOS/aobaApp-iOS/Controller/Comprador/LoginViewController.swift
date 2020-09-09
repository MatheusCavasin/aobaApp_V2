//
//  LoginViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 13/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnEntrar: UIButton!
    @IBOutlet weak var btnCadastro: UIButton!
    @IBOutlet weak var btnEntrarComApple: UIButton!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnCadastro()
        setBtnEntrar()
        setEntrarComApple()
        
        self.hideKeyboardWhenTappedAround()
        self.txtEmail.keyboardType = UIKeyboardType.emailAddress
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }

    func setBtnCadastro() {
        btnCadastro.layer.borderWidth = 2.0
        btnCadastro.layer.borderColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        btnCadastro.layer.cornerRadius = 5.0
    }
    
    func setBtnEntrar() {
        btnEntrar.layer.cornerRadius = 5.0
    }
    
    
    func setEntrarComApple() {
        btnEntrarComApple.layer.borderWidth = 0.5
        btnEntrarComApple.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
        btnEntrarComApple.layer.cornerRadius = 5.0
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
