//
//  ListaCompletaTableViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 15/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class ListaCompletaTableViewController: UITableViewController {

    //var carrinho: Carrinho!
    var carrinhoCriado: CarrinhoData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrinhoCriado.itens.count + 2
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  indexPath.row < carrinhoCriado.itens.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
            cell.config(produto: carrinhoCriado.itens[indexPath.row])
            return cell
        } else if indexPath.row == carrinhoCriado.itens.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "valorCarrinho") as! ValorTotalTodosItensTableViewCell
            cell.config(valor: carrinhoCriado.valorTotal)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteTodosItensTableViewCell
            cell.config(valor: carrinhoCriado.valorFrete)
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            self.carrinhoCriado.itens.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let rename = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
            
        }
        
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [rename, delete])
        swipeActionConfig.performsFirstActionWithFullSwipe = false
        return swipeActionConfig
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < carrinhoCriado.itens.count {
            return 91
        } else {
            return 60
        }
        
    }
    

}
