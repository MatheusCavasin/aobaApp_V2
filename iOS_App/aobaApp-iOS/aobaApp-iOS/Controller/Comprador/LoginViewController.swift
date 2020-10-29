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

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
    @IBOutlet weak var loadingView: UIView!
    
    
    @IBOutlet weak var btnNBVoltar: UIButton!
    
    var request = CompradorRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtnCadastro()
        setBtnEntrar()
        self.loadingView.isHidden = true
        
        
        self.hideKeyboardWhenTappedAround()
        self.txtEmail.keyboardType = UIKeyboardType.emailAddress
        
        
        // observvables
        NotificationCenter.default.addObserver(self, selector: #selector(self.erroAoLogar), name: NSNotification.Name(rawValue: "ErroAoLogar"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.sucessoAoLogar), name: NSNotification.Name(rawValue: "SucessoAoLogar"), object: nil)
    }
    
    /*
    static func instanceLoginView() -> LoginViewController {
        let loginView = UIStoryboard(name: "CadastroComprador", bundle: nil)
        let loginController = loginView.instantiateViewController(identifier: "login")
        return loginController as! LoginViewController
    }*/
    
    
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
    
    @objc func erroAoLogar() {
        loadingView.isHidden = true
        
        let alert = UIAlertController(title: "Erro ao tentar logar-se", message: "Usuário ou senha incorreto", preferredStyle: .alert)
        alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func sucessoAoLogar() {
        loadingView.isHidden = true
        Singleton.shared.loggedIn = true
        Singleton.shared.carrinhoPedido = CarrinhoPedido(compradorId: Singleton.shared.comercianteLogado!.id)
        
        self.dismiss(animated: true, completion: nil)
    }

    func setBtnCadastro() {
        btnCadastro.layer.borderWidth = 2.0
        btnCadastro.layer.borderColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        btnCadastro.layer.cornerRadius = 5.0
    }
    
    func setBtnEntrar() {
        btnEntrar.layer.cornerRadius = 5.0
    }
    
    @IBAction func btnEntrarPressed(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(txtEmail.text, forKey: "Usuario")
        defaults.set(txtSenha.text, forKey: "senha")
        
        showLoadingView()
        request.login()
        
    }
    
    
    private func showLoadingView() {
        loadingView.isHidden = false
    }
    
    
    @IBAction func btnNBVoltarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
