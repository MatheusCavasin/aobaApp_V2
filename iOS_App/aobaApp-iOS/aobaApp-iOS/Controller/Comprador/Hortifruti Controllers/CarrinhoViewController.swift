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
    var quantidadeDeProdutos = (Singleton.shared.carrinho["produtos"] as! [Dictionary<String, Any>]).count

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()

    }
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quantidadeDeProdutos + 2
        
    }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row <= quantidadeDeProdutos - 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "produto") as! ProdutoDoCarrinhoTableViewCell
            let produtos: [Dictionary<String, Any>] = Singleton.shared.carrinho["produtos"] as! [Dictionary<String, Any>]
            cell.config(produto: produtos[indexPath.row])
            return cell
        }
        
        else if indexPath.row == quantidadeDeProdutos {
            let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
            cell.config(carrinho: Singleton.shared.carrinho)
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
        cell.config(carrinho: Singleton.shared.carrinho)
        return cell
        
            
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row <= quantidadeDeProdutos - 1 {
            return 60
        } else if indexPath.row == quantidadeDeProdutos {
            return 230
        }
        return 325
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row <= quantidadeDeProdutos - 1 {
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
