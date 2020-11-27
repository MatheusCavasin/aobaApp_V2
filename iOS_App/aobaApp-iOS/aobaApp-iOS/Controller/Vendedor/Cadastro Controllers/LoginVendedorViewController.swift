//
//  LoginVendedorViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 13/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit
import Firebase

class LoginVendedorViewController: UIViewController {
    
    
    @IBOutlet weak var EntrarButton: UIButton!
    @IBOutlet weak var CriarButton: UIButton!
    @IBOutlet weak var emailVendedor: UITextField!
    @IBOutlet weak var senhaVendedor: UITextField!
    
    var userID = ""
    let produtorRepository = ProdutorRepository()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.prefersLargeTitles = true
        EntrarButton.layer.cornerRadius = 5
        CriarButton.layer.cornerRadius = 5
        CriarButton.layer.borderWidth = 2
        CriarButton.layer.borderColor = #colorLiteral(red: 1, green: 0.5716887116, blue: 0.1306569278, alpha: 1)
        
        self.hideKeyboardWhenTappedAround()
        self.emailVendedor.keyboardType = UIKeyboardType.emailAddress

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

//        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func entrarButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        LoadView.shared.showLoadView(self.view)
        defaults.set(emailVendedor.text, forKey: "Usuario")
        defaults.set(senhaVendedor.text, forKey: "senha")
        produtorRepository.login { (result, err) in
            DispatchQueue.main.async {
                LoadView.shared.hideLoadView()
                if result != nil {
                    self.produtorRepository.getProdutos()
                    let controller: PrincipalVendedor
                    let view  = UIStoryboard(name: "PrincipalVendedor", bundle: nil)
                    controller = view.instantiateViewController(identifier: "TabVendedor") as! PrincipalVendedor
                    self.navigationController?.pushViewController(controller, animated: true)
                } else {
                    let alert = UIAlertController(title: "Erro ao tentar logar", message: "Confira seus dados e tente novamente", preferredStyle: .alert)
                    alert.view.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
        
        
        
        /*
        let username = "username"
        let password = "password"
        let loginString = "\(username):\(password)"
        
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        let url = URL(string: "http://192.168.1.2/rest")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        */
        
        
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
