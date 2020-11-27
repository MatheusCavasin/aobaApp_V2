//
//  ListaCompletaVendedorTableViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 25/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class ListaCompletaVendedorTableViewController: UITableViewController {

    var itens = [[String : Any?]]()
    var datasEntrega = [[String : Any?]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.itens.count + 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < self.itens.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
            cell.configVendedor(produto: self.itens[indexPath.row], data: self.datasEntrega)
            return cell
        } else if indexPath.row == self.itens.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "valorCarrinho") as! ValorTotalTodosItensTableViewCell
            cell.config(valor: ModelVendedor.instance.dictListaCarrinho[0]["valorTotal"] as? Float ?? 0.00)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteTodosItensTableViewCell
            cell.config(valor: ModelVendedor.instance.dictListaCarrinho[0]["valorFrete"] as? Float ?? 0.00)
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < self.itens.count {
            return 91
        } else {
            return 60
        }
        
    }

}
