//
//  TabAnuncioVendedorViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 14/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class TabAnuncioVendedorViewController: UIViewController {

  
    @IBOutlet weak var CriarAnuncioButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CriarAnuncioButton.layer.cornerRadius = 5
        CriarAnuncioButton.layer.borderWidth = 2
        CriarAnuncioButton.layer.borderColor = #colorLiteral(red: 1, green: 0.5716887116, blue: 0.1306569278, alpha: 1)

        // Do any additional setup after loading the view.
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
