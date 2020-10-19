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
    @IBOutlet weak var viwLoadView: UIView!
    
    
    // Variavel que armazena todos os dados do carrinho que foram retornados pela requisicao
    var carrinhoCriado: CarrinhoData?
    
    // Esse é o carrinho antigo, com tudo feito por aqui
    var carrinho: Carrinho!
    
    var maisDeTresItems: Bool!
    let repository = CarrinhoRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuraçoes da TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
        
        // Configuraçao do carrinho
        self.carrinho =  Singleton.shared.carrinho
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
        
        self.viwLoadView.isHidden = false
        if let carrinhoPedido = Singleton.shared.carrinhoPedido {
            repository.getCarrinho(carrinhoPedido: carrinhoPedido) { (result, err) in
                if let result = result {
                    DispatchQueue.main.async {
                        // Quando carregado, esconde a tela de load e atribui o valor de carrinhoData
                        self.viwLoadView.isHidden = true
                        self.carrinhoCriado = CarrinhoData.jsonToObject(dict: result as! Dictionary<String, Any>)
                    }
                } else {
                    print(err as Any)
                }
            }
        } else {
            let alert = UIAlertController(title: "Erro ao carregar o carrinho", message: "Lembre-se de entrar em sua conta para acessar o carrinho", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Entrar", comment: "Default action"), style: .default, handler: { _ in
                let loginView = UIStoryboard(name: "CadastroComprador", bundle: nil)
                let loginController = loginView.instantiateViewController(identifier: "login")
                loginController.modalPresentationStyle = .fullScreen
                self.show(loginController, sender: self)
            }))
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancelar", comment: "Default action"), style: .default, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        tableView.reloadData()
    }
    
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if maisDeTresItems {
            return 10
        } else {
            return carrinho.produtos.count + 6
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
            } else if indexPath.row == 5 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
                cell.config(carrinho: carrinho, navigationController: self.navigationController!)
                return cell
            } else if indexPath.row == 6 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteCarrinhoTableViewCell
                cell.config(carrinho: carrinho)
                return cell
            } else if indexPath.row == 7 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "dataEntrega") as! DataEntregaTableViewCell
                return cell
            } else if indexPath.row == 8 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                cell.config(valorTotal: carrinho.valorEntrega + carrinho.valorProdutos)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "botao")!
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
            } else if indexPath.row == carrinho.produtos.count + 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "dataEntrega") as! DataEntregaTableViewCell
                return cell
            } else if indexPath.row == carrinho.produtos.count + 4{
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                cell.config(valorTotal: carrinho.valorEntrega + carrinho.valorProdutos)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "botao")!
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
            } else if indexPath.row == 9 {
                let alert = UIAlertController(title: "AOOOBA", message: "Pedido realizado com sucesso. Agora é só aguardar ele chegar até você", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            if indexPath.row == carrinho.produtos.count + 1 {
                let enderecoCompradorController: EnderecoCompradorViewController!
                let enderecoCompradorView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
                
                enderecoCompradorController = enderecoCompradorView.instantiateViewController(identifier: "enderecos") as? EnderecoCompradorViewController
                
                navigationController!.showDetailViewController(enderecoCompradorController, sender: self)
                enderecoCompradorController.navigationItem.title = "Enderecos"
                enderecoCompradorController.carrinhoController = self
            } else if indexPath.row == carrinho.produtos.count + 5 {
                let alert = UIAlertController(title: "AOOOBA", message: "Pedido realizado com sucesso. Agora é só aguardar ele chegar até você", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if maisDeTresItems {
            if indexPath.row <= 4 || indexPath.row == 6{
                return 60
            } else if indexPath.row == 5{
                return 120
            } else if indexPath.row == 7 {
                return 100
            } else {
                return  150
            }
        } else {
            if indexPath.row <= carrinho.produtos.count || indexPath.row == carrinho.produtos.count + 2{
                return 60
            } else if indexPath.row == carrinho.produtos.count + 1{
                return 120
            } else if indexPath.row == carrinho.produtos.count + 3 {
                return 100
            } else {
                return 150
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row <= carrinho.produtos.count - 1 && !maisDeTresItems || indexPath.row < 3 && maisDeTresItems {
            let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
                
                Singleton.shared.carrinho.produtos.remove(at: indexPath.row)
                Singleton.shared.carrinho.valorProdutos = self.calcularTotal()
                self.carrinho = Singleton.shared.carrinho
                
                if self.carrinho.produtos.count > 3 {
                    self.maisDeTresItems = true
                } else {
                    self.maisDeTresItems = false
                }
                
                tableView.reloadData()
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
    
    private func calcularTotal() -> Float {
        var total: Float = 0.0
        for produtos in Singleton.shared.carrinho.produtos {
            total += produtos.anuncio.valor * Float(produtos.anuncio.qtdeMax)
        }
        return total
    }
    
}
