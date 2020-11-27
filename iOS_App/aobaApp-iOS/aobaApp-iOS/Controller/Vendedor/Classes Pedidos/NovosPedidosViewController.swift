//
//  NovosPedidosViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 27/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class NovosPedidosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellsAnuncioDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var itens = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
        tableView.register(NovoPedidoTableViewCell.nib(), forCellReuseIdentifier: NovoPedidoTableViewCell.identifier)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     /*   if indexPath.row < itens {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
            cell.configVendedor(produto: self.itens[indexPath.row], data: self.datasEntrega)
            return cell
        } */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmarPedidoCell", for: indexPath) as! confirmarAnuncio
        cell.delegate = self
        return cell
    }

    func recusarPedidoPressed() {
        print("RECUSAR")
    }
    
    func aceitarPedidoPressed() {
        print("ACEITAR")

    }
    
}
