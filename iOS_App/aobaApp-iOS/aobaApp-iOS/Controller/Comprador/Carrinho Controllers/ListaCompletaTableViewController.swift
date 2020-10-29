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
    let repository = CarrinhoRepository()
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
            self.carrinhoCriado?.itens.remove(at: indexPath.row)
            Singleton.shared.carrinhoPedido?.itensDoCarrinho.remove(at: indexPath.row)
            
            
            if let carrinhoPedido = Singleton.shared.carrinhoPedido {
                self.repository.getCarrinho(carrinhoPedido: carrinhoPedido) { (result, err) in
                    if let result = result {
                        print(result)
                        DispatchQueue.main.async {
                            // Quando carregado, esconde a tela de load e atribui o valor de carrinhoData
                            
                            self.carrinhoCriado = CarrinhoData.jsonToObject(dict: result as! Dictionary<String, Any>)
                            self.tableView.reloadData()
                        }
                    } else {
                        print(err as Any)
                    }
                }
            }
            tableView.reloadData()
            completionHandler(true)
        }
        
        
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [delete])
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
