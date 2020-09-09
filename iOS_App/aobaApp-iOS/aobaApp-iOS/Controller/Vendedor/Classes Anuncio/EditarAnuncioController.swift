//
//  EditarAnuncioController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 02/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class EditarAnuncioController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewEditar: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewEditar.delegate = self
        tableViewEditar.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lblProdutoCell", for: indexPath) as! EditarAnuncioTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lblQtdeCaixasCell", for: indexPath) as! EditarAnuncioTableViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "qtdeCaixasCell", for: indexPath) as! QtdeCaixasCell
            return cell
        } else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "lblValorCell", for: indexPath) as! EditarAnuncioTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "txtValorCell", for: indexPath) as! TextFieldValorCell
            return cell
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
