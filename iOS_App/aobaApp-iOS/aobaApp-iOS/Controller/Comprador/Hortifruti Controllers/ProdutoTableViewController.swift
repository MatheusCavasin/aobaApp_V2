//
//  ProdutosViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class ProdutoTableViewController: UITableViewController {
   
    var btnCarrinho: UIBarButtonItem!
    var produtos: [Dictionary<String, Any>]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Controller
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        btnCarrinho = UIBarButtonItem(image: UIImage(named: "icone-carrinho")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(self.addTappped))
        navigationItem.setRightBarButton(btnCarrinho, animated: true)
        

        // TableView
        tableView.separatorStyle = .none
        tableView.register(ProdutoTableViewCell.nib(), forCellReuseIdentifier: ProdutoTableViewCell.identifier)
        
    }
    
    @objc func addTappped() {
        irParaOCarrinho()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produtos.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == produtos.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoTableViewCell.identifier, for: indexPath) as! ProdutoTableViewCell
        cell.config(produto: produtos[indexPath.row])
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Melhora a navegacao
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: false)
        
        // Apertou o botao do carrinho
        if indexPath.row == produtos.count {
            irParaOCarrinho()
        }
        else {
            abrirDetalhesDoProduto(indexPath: indexPath)
        }
    }

    
    private func irParaOCarrinho() {
        let carrinhoViewController: CarrinhoViewController!
        let carrinhoView = UIStoryboard(name: "TabHortifrutiComprador", bundle: nil)
        carrinhoViewController = carrinhoView.instantiateViewController(identifier: "carrinho") as? CarrinhoViewController
        self.navigationController?.showDetailViewController(carrinhoViewController, sender: self)
    }
    
    private func  abrirDetalhesDoProduto(indexPath: IndexPath) {
        let detalhesDoProdutoViewController: DetalhesDoProdutoViewController!
        let detalhesDoProdutoView = UIStoryboard(name: "TabHortifrutiComprador", bundle: nil)
        detalhesDoProdutoViewController = detalhesDoProdutoView.instantiateViewController(identifier: "detalhesDoProduto") as? DetalhesDoProdutoViewController
        
        detalhesDoProdutoViewController.produto = produtos[indexPath.row]
        self.navigationController?.showDetailViewController(detalhesDoProdutoViewController, sender: self)
    }
}
