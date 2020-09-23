//
//  CarrinhoViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 19/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class CarrinhoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnCancelar: UIButton!
    var carrinho: [AtivosProduto]!
    var maisDeTresItems: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        carrinho =  Singleton.shared.carrinho
        if carrinho.count > 3 {
            maisDeTresItems = true
        } else {
            maisDeTresItems = false
        }
        tableView.reloadData()
    }
    
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if maisDeTresItems {
            return 6
        } else {
            return carrinho.count + 2
        }
    }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if maisDeTresItems {
            if indexPath.row < 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
                cell.config(produto: carrinho[indexPath.row])
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "listaCompleta")
                return cell!
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
                cell.config(carrinho: carrinho)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                cell.config(carrinho: Singleton.shared.carrinho)
                return cell
            }
        } else {
            if indexPath.row < carrinho.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
                cell.config(produto: carrinho[indexPath.row])
                return cell
            } else if indexPath.row == carrinho.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
                cell.config(carrinho: carrinho)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                cell.config(carrinho: Singleton.shared.carrinho)
                return cell
            }
        }
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if maisDeTresItems {
            if indexPath.row == 3 {
                let listaCompletaController: ListaCompletaTableViewController!
                let listaCompletaView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
                
                
                listaCompletaController = listaCompletaView.instantiateViewController(identifier: "todosOsProdutos") as? ListaCompletaTableViewController
                
                // Melhora a navegação
                self.navigationController!.show(listaCompletaController, sender: self)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if maisDeTresItems {
            if indexPath.row <= 3 {
                return 60
            } else if indexPath.row == 4{
                return 230
            } else {
                return  325
            }
        } else {
            if indexPath.row < carrinho.count {
                return 60
            } else if indexPath.row == carrinho.count {
                return 230
            } else {
                return 325
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row <= carrinho.count - 1 {
            let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
                // Colocar aqui o que vai acontecer quando o usuario quiser excluir um item do carrinho
                completionHandler(true)
            }

            let rename = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
                // Colocar aqui o que vai acontecer quando o usuario quiser editar o carrinho
                completionHandler(true)
            }
            let swipeActionConfig = UISwipeActionsConfiguration(actions: [rename, delete])
            swipeActionConfig.performsFirstActionWithFullSwipe = false
            return swipeActionConfig
        }
        return nil
    }

}
