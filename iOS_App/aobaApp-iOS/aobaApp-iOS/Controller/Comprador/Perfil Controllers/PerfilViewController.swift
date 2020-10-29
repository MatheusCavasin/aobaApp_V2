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
        
        // se nao estiver logado, deve logar
        if !Singleton.shared.loggedIn {
            let loginView = UIStoryboard(name: "CadastroComprador", bundle: nil)
            let loginController = loginView.instantiateViewController(identifier: "login")
            loginController.modalPresentationStyle = .fullScreen
            self.show(loginController, sender: self)
        }
        
        //Configuraçoes da table
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CampoPerfilTableViewCell.nib(), forCellReuseIdentifier: CampoPerfilTableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !Singleton.shared.loggedIn {
            self.dismiss(animated: true, completion: nil)
        } else {
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CampoPerfilTableViewCell.identifier) as! CampoPerfilTableViewCell
        
        if indexPath.row == 0 {
            cell.config(systemImageName: "icone-loja", title: Singleton.shared.comercianteLogado?.nomeFantasia ?? "Nome fantasia")
        } else if indexPath.row == 1 {
            cell.config(systemImageName: "icone-localizacao", title: "Meus endereços")
        } else if indexPath.row == 2{
            cell.config(systemImageName: "creditcard.fill", title: "Métodos de pagamento")
        } else {
            cell.config(systemImageName: "icone-sair", title: "Sair da conta")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false //Melhora a navegaçao
        
        // Abre a tela de perfil
        if indexPath.row == 0 {
            let controller: DadosCadastraisViewController!
            let view = UIStoryboard(name: "TabPerfilComprador", bundle: nil)
            controller = view.instantiateViewController(identifier: DadosCadastraisViewController.identifier) as DadosCadastraisViewController
            controller.navigationItem.title = "Nome fantasia"
            navigationController?.show(controller, sender: self)
        }
        // Abre a tela de enderecos
        else if indexPath.row == 1 {
            let enderecoCompradorController: EnderecoCompradorViewController!
            let enderecoCompradorView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
            enderecoCompradorController = enderecoCompradorView.instantiateViewController(identifier: "enderecos") as? EnderecoCompradorViewController
            navigationController!.showDetailViewController(enderecoCompradorController, sender: self)
            enderecoCompradorController.navigationItem.title = "Enderecos"
        }
        
        // sai da conta atual
        else if indexPath.row == 3 {
            let alert = UIAlertController(title: "Sair da conta", message: "Tem certeza que deseja sair da conta atual?", preferredStyle: .alert)
            alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Sim", comment: "sair"), style: .destructive, handler: { _ in
                Singleton.shared.loggedIn = false
                Singleton.shared.comercianteLogado = nil
                Singleton.shared.carrinhoPedido = nil
                Singleton.shared.enderecoDeEntrega = nil
                self.dismiss(animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancelar", comment: "Default action"), style: .cancel, handler: { _ in
                //nao faz nada
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    
    

}
