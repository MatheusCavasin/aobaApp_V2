//
//  CodigoComercianteViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 30/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class CodigoComercianteViewController: UIViewController {
    @IBOutlet weak var continuarButton: UIButton!
    @IBOutlet weak var codigoText: UITextField!
    
    var codigoAcesso: String = "AOBA2020"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        continuarButton.layer.cornerRadius = ButtonConfig.raioBorda
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continuarActButton(_ sender: Any) {
        
        if codigoText.text?.uppercased() == codigoAcesso.uppercased() {

            let controller: PrimeiraTelaDeCadastroViewController!
            let view = UIStoryboard(name: "CadastroComprador", bundle: nil)
            controller = view.instantiateViewController(identifier: "primeiraTelaCadastro") as? PrimeiraTelaDeCadastroViewController
            self.navigationController?.pushViewController(controller, animated: true)
        } else {
            let alert = UIAlertController(title: "Alerta", message: "O código inserido está incorreto", preferredStyle: .alert)
            alert.view.tintColor = #colorLiteral(red: 1, green: 0.5716887116, blue: 0.1306569278, alpha: 1)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
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
