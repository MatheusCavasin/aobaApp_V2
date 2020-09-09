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
        ProximoButton.layer.cornerRadius = ButtonConfig.raioBorda
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)


        // Do any additional setup after loading the view.
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
        
        ModelVendedor.instance.nome = nomeTextField.text!
        ModelVendedor.instance.email = emailTextField.text!
        ModelVendedor.instance.senha = senhaTextField.text!
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
