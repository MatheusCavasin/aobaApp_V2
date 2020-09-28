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
    
    
    var carrinho: Carrinho!
    var maisDeTresItems: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
        
        carrinho =  Singleton.shared.carrinho
        
        if (Singleton.shared.comercianteLogado?.enderecos.count ?? 0) > 1 {
            carrinho.setEndereco(novoEndereco: Singleton.shared.comercianteLogado?.enderecos[0])
        }
       
    }

    override func viewWillAppear(_ animated: Bool) {
        carrinho =  Singleton.shared.carrinho
        
        if (Singleton.shared.comercianteLogado?.enderecos.count ?? 0) > 1 {
            carrinho.setEndereco(novoEndereco: Singleton.shared.comercianteLogado?.enderecos[0])
        }
        
        if carrinho.produtos.count > 3 {
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
            return 8
        } else {
            return carrinho.produtos.count + 4
        }
    }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if maisDeTresItems {
            if indexPath.row < 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
                cell.config(produto: carrinho.produtos[indexPath.row])
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "listaCompleta")
                return cell!
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "subTotal") as! SubTotalCarrinhoTableViewCell
                cell.config(carrinho: carrinho)
                return cell
            }
            else if indexPath.row == 5 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
                cell.config(carrinho: carrinho, navigationController: self.navigationController!)
                return cell
            } else if indexPath.row == 6 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteCarrinhoTableViewCell
                cell.config(carrinho: carrinho)
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                cell.config(valorTotal: carrinho.valorEntrega + carrinho.valorProdutos)
                return cell
            }
        } else {
            if indexPath.row < carrinho.produtos.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
                cell.config(produto: carrinho.produtos[indexPath.row])
                return cell
                
            } else if indexPath.row == carrinho.produtos.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "subTotal") as! SubTotalCarrinhoTableViewCell
                cell.config(carrinho: carrinho)
                return cell
            } else if indexPath.row == carrinho.produtos.count + 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
                cell.config(carrinho: carrinho, navigationController: self.navigationController!)
                return cell
            } else if indexPath.row == carrinho.produtos.count + 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteCarrinhoTableViewCell
                cell.config(carrinho: carrinho)
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                cell.config(valorTotal: carrinho.valorEntrega + carrinho.valorProdutos)
                return cell
            }
        }
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Melhora a navegação
        tableView.cellForRow(at: indexPath)?.isSelected = false
        
        if maisDeTresItems {
            if indexPath.row == 3 {
                let listaCompletaController: ListaCompletaTableViewController!
                let listaCompletaView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
                
                listaCompletaController = listaCompletaView.instantiateViewController(identifier: "todosOsProdutos") as? ListaCompletaTableViewController
                self.navigationController!.show(listaCompletaController, sender: self)
            } else if indexPath.row == 5{
                let enderecoCompradorController: EnderecoCompradorViewController!
                let enderecoCompradorView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
                
                enderecoCompradorController = enderecoCompradorView.instantiateViewController(identifier: "enderecos") as? EnderecoCompradorViewController
                
                navigationController!.showDetailViewController(enderecoCompradorController, sender: self)
                enderecoCompradorController.navigationItem.title = "Enderecos"
                enderecoCompradorController.carrinhoController = self
                
            }
        } else {
            if indexPath.row == carrinho.produtos.count + 1 {
                let enderecoCompradorController: EnderecoCompradorViewController!
                let enderecoCompradorView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
                
                enderecoCompradorController = enderecoCompradorView.instantiateViewController(identifier: "enderecos") as? EnderecoCompradorViewController
                
                navigationController!.showDetailViewController(enderecoCompradorController, sender: self)
                enderecoCompradorController.navigationItem.title = "Enderecos"
                enderecoCompradorController.carrinhoController = self
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if maisDeTresItems {
            if indexPath.row <= 4 || indexPath.row == 6{
                return 60
            } else if indexPath.row == 5{
                return 120
            } else {
                return  325
            }
        } else {
            if indexPath.row <= carrinho.produtos.count || indexPath.row == carrinho.produtos.count + 2{
                return 60
            } else if indexPath.row == carrinho.produtos.count + 1{
                return 120
            } else {
                return 325
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row <= carrinho.produtos.count - 1 {
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
