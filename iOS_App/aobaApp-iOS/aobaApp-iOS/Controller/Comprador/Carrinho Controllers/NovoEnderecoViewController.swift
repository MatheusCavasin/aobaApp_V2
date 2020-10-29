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
    @IBOutlet weak var viewLoadView: UIView!
    
    var presentingController: EnderecoCompradorViewController!
    let repository = CompradorRepository()
    var novoEndereco: EnderecoData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //keyboard
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //Request
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadView), name: NSNotification.Name(rawValue: "EnderecoAdicionado"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.erroAoCarregar), name: NSNotification.Name(rawValue: "ErroAoAdicionarEndereco"), object: nil)
        viewLoadView.isHidden = true
    }
    
    @objc func reloadView() {
        Singleton.shared.comercianteLogado?.enderecos.append(novoEndereco!)
        self.presentingController.reloadData()
        self.dismiss(animated: true, completion: nil)
        
        // Dismiss load view
        viewLoadView.isHidden = true
    }
    
    @objc func erroAoCarregar() {
        viewLoadView.isHidden = true
        let alert = UIAlertController(title: "Erro ao adicionar endereço", message: "Você deve estar logado para adicionar um endereço", preferredStyle: .alert)
        alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
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
            
            self.novoEndereco = EnderecoData(bairro: txtBairro.text!, cep: txtCep.text!, cidade: txtCidade.text!, complemento: txtComplemento.text!, id: 0, latitude: 0, longitude: 0, logradouro: txtRua.text!, numero: Int(txtNumero.text!)!, uf: txtUf.text!)
            
            self.chamarDados(endereco: novoEndereco!)
        }
        
        else {
            let alert = UIAlertController(title: "Erro ao adicionar endereço", message: "Todos os campos devem ser preenchidos corretamente", preferredStyle: .alert)
            alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func chamarDados(endereco: EnderecoData) {
        repository.addEndereco(endereco: endereco)
        viewLoadView.isHidden = false
    }
}
