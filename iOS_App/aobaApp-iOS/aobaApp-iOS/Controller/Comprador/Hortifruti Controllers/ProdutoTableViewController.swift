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
    var produtos: [AtivosProduto] = []
    var produtosContador: Int = 0
    var anuncios: [AtivosAnuncio] = []
    
    var diaDaSemana: String!
    var classificadorDeSecoes = ClassificadorDeSecoes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Controller
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Busque aqui seu produto"
        

        // TableView
        tableView.separatorStyle = .none
        tableView.register(ProdutoTableViewCell.nib(), forCellReuseIdentifier: ProdutoTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anuncios = []
        produtosContador = 0
        for produto in produtos {
            anuncios.append(contentsOf: produto.anuncios)
        }
        tableView.reloadData()
    }
    
    @objc func addTappped() {
        irParaOCarrinho()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return anuncios.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == produtos.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoTableViewCell.identifier, for: indexPath) as! ProdutoTableViewCell
        
        if produtos[produtosContador].anuncios.count > indexPath.row {
            produtosContador = 0
        } else {
            produtosContador += 1
        }
        cell.config(nomeProduto: produtos[produtosContador].nome, anuncio: anuncios[indexPath.row])
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
        self.tabBarController?.selectedIndex = 1
    }
    
    private func  abrirDetalhesDoProduto(indexPath: IndexPath) {
        let detalhesDoProdutoViewController: DetalhesDoProdutoViewController!
        let detalhesDoProdutoView = UIStoryboard(name: "TabHortifrutiComprador", bundle: nil)
        detalhesDoProdutoViewController = detalhesDoProdutoView.instantiateViewController(identifier: "detalhesDoProduto") as? DetalhesDoProdutoViewController
        
        detalhesDoProdutoViewController.nomeDoProduto = getNomeProduto(row: indexPath.row)
        detalhesDoProdutoViewController.anuncio = anuncios[indexPath.row]
        self.navigationController?.showDetailViewController(detalhesDoProdutoViewController, sender: self)
    }
    
    private func getNomeProduto(row: Int) -> String? {
        var contador: Int = 0
        
        for produto in produtos {
            contador += produto.anuncios.count
            if contador > row {
                return produto.nome
            }
        }
        
        return nil
    }
}
