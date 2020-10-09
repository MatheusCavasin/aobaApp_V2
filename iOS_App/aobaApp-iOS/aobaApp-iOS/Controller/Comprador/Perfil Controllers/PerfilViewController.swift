//
//  PerfilViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 09/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configuraçoes da table
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CampoPerfilTableViewCell.identifier) as! CampoPerfilTableViewCell
        if indexPath.row == 0 {
            cell.config(systemImageName: "person.fill", title: "Nome Completo")
        } else if indexPath.row == 1 {
            cell.config(systemImageName: "lock.fill", title: "Senha")
        } else {
            cell.config(systemImageName: "teletype.answer", title: "Telefone")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    
    // teletype.answer
    // lock.fill
    // person.fill

}
