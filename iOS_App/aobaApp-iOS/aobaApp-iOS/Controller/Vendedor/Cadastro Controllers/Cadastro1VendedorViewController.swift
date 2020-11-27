//
//  Cadastro1ViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 13/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation
import UIKit

class Cadastro1VendedorViewController: UIViewController {

    @IBOutlet weak var ProximoButton: UIButton!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmacaoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastro"
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        ProximoButton.layer.cornerRadius = ButtonConfig.raioBorda
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150
    }
    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func proximoButton(_ sender: Any) {
        if emailTextField.text!.isEmpty || senhaTextField.text!.isEmpty || confirmacaoTextField.text!.isEmpty || nomeTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Alerta", message: "Esses campos são obrigatórios", preferredStyle: .alert)
            alert.view.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            if senhaTextField.text == confirmacaoTextField.text {
                ModelVendedor.instance.nome = nomeTextField.text!
                ModelVendedor.instance.email = emailTextField.text!
                ModelVendedor.instance.senha = senhaTextField.text!
                let controller: Cadastro2VendedorViewController!
                let view = UIStoryboard(name: "CadastroVendedor", bundle: nil)
                controller = view.instantiateViewController(identifier: "cadastroVendedor02") as? Cadastro2VendedorViewController
                self.navigationController?.pushViewController(controller, animated: true)
            } else {
                let alert = UIAlertController(title: "Alerta", message: "As senhas não correspondem", preferredStyle: .alert)
                alert.view.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }   
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
