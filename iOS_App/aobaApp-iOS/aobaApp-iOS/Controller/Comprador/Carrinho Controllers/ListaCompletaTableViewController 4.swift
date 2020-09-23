//
//  ListaCompletaTableViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 15/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class ListaCompletaTableViewController: UITableViewController {

    var carrinho: [AtivosProduto]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        carrinho = Singleton.shared.carrinho
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrinho.count + 2
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  indexPath.row < carrinho.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
            cell.config(produto: carrinho[indexPath.row])
            return cell
        } else if indexPath.row == carrinho.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "valorCarrinho")
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete")
            return cell!
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    

}
