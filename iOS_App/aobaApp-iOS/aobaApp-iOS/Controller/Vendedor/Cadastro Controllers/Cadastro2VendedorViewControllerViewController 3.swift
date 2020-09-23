//
//  Cadastro2VendedorViewControllerViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 13/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class Cadastro2VendedorViewControllerViewController: UIViewController {

    @IBOutlet weak var CadastrarButton: UIButton!
    @IBOutlet weak var descricaoTextField: UITextField!
    @IBOutlet weak var cnpjTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var localTextField: UITextField!
    
    let produtorRepository = ProdutorRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastro"
        CadastrarButton.layer.cornerRadius = ButtonConfig.raioBorda
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)


        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func cadastrarButton(_ sender: Any) {
        
        let produtor: Produtor = Produtor(email: ModelVendedor.instance.email,
                                          senha: ModelVendedor.instance.senha,
                                          nome: ModelVendedor.instance.nome,
                                          codigo_registro: cnpjTextField.text!,
                                          foto: "",
                                          descricao: descricaoTextField.text!)
        produtorRepository.create(produtor: produtor)

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
