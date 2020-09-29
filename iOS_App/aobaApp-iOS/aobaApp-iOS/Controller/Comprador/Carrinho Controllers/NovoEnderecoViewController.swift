//
//  NovoEnderecoViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 28/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class NovoEnderecoViewController: UIViewController {

    @IBOutlet weak var txtCep: UITextField!
    @IBOutlet weak var txtRua: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    @IBOutlet weak var txtComplemento: UITextField!
    @IBOutlet weak var txtBairro: UITextField!
    @IBOutlet weak var txtCidade: UITextField!
    @IBOutlet weak var txtUf: UITextField!
    @IBOutlet weak var btnCancelar: UIButton!
    @IBOutlet weak var btnSalvarEndereco: UIButton!
    
    var presentingController: EnderecoCompradorViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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

    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnSalvarEnderercoPressed(_ sender: Any) {
        if txtCep.text != "" && txtRua.text != "" && txtCep.text != "" && txtNumero.text != "" && txtBairro.text != "" && txtCidade.text != "" && txtUf.text != "" {
            
            let novoEndereco = EnderecoData(bairro: txtBairro.text!, cep: txtCep.text!, cidade: txtCidade.text!, complemento: txtComplemento.text!, id: 0, latitude: 0, longitude: 0, logradouro: txtRua.text!, numero: Int(txtNumero.text!)!, uf: txtUf.text!)
            
            Singleton.shared.comercianteLogado?.enderecos.append(novoEndereco)
            self.presentingController.reloadData()
            self.dismiss(animated: true, completion: nil)
            
        }
        
        else {
            let alert = UIAlertController(title: "Erro ao adicionar endereço", message: "Todos os campos devem ser preenchidos corretamete", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
