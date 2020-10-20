//
//  DadosCadastraisViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 15/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class DadosCadastraisViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    static let identifier = "dadosCadastrais"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation
        navigationItem.title = Singleton.shared.comercianteLogado!.nomeFantasia
        
        
        //Configuraçoes da table
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CampoPerfilTableViewCell.nib(), forCellReuseIdentifier: CampoPerfilTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CampoPerfilTableViewCell.identifier) as! CampoPerfilTableViewCell
        if indexPath.row == 0 {
            cell.config(systemImageName: "person.fill", title: "Nome completo")
        } else if indexPath.row == 1 {
            cell.config(systemImageName: "lock.fill", title: "Senha")
        } else {
            cell.config(systemImageName: "icone-telefone", title: "Telefone")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.isSelected = false //Melhora a navegaçao
        
        let view = UIStoryboard(name: "TabPerfilComprador", bundle: nil)
        var controller: UIViewController
        if indexPath.row == 0 {
            controller = view.instantiateViewController(identifier: "nome completo") as! NomePerfilViewController
        } else if indexPath.row == 1 {
            controller = view.instantiateViewController(identifier: "senha") as! SenhaPerfilViewController
        } else {
            controller = view.instantiateViewController(identifier: "telefone") as! TelefonePerfilViewController
        }
        
        navigationController?.showDetailViewController(controller, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
}

