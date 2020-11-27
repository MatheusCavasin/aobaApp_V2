//
//  Cadastro2VendedorViewControllerViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 13/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class Cadastro2VendedorViewController: UIViewController {

    @IBOutlet weak var CadastrarButton: UIButton!
    @IBOutlet weak var nomeFantasia: UITextField!
    @IBOutlet weak var descricaoTextField: UITextField!
    @IBOutlet weak var cnpjTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    
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
        if descricaoTextField.text!.isEmpty || cnpjTextField.text!.isEmpty || telefoneTextField.text!.isEmpty || nomeFantasia.text!.isEmpty{
            let alert = UIAlertController(title: "Alerta", message: "Todos os campos devem ser preenchidos. Certifiique-se de que não há nenhum campo em branco", preferredStyle: .alert)
            alert.view.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            ModelVendedor.instance.telefone = telefoneTextField.text!
            ModelVendedor.instance.descricao = descricaoTextField.text!
            ModelVendedor.instance.codigo_registro = cnpjTextField.text!
            ModelVendedor.instance.nomeFantasia = nomeFantasia.text!
            let controller: Cadastro3VendedorViewController!
            let view = UIStoryboard(name: "CadastroVendedor", bundle: nil)
            controller = view.instantiateViewController(identifier: "cadastroVendedor03") as? Cadastro3VendedorViewController
            self.navigationController?.pushViewController(controller, animated: true)
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
