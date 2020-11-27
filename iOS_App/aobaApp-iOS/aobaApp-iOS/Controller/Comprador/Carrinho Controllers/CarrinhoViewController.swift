//
//  CarrinhoViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 19/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class CarrinhoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnCancelar: UIButton!
    @IBOutlet weak var viwLoadView: UIView!
    var carrinhoCriado: CarrinhoData?// Variavel que armazena todos os dados do carrinho que foram retornados pela requisicao
    //var carrinho: Carrinho!  // Esse é o carrinho antigo, com tudo feito por aqui
    //var endereco: EnderecoData?
    var maisDeTresItems: Bool!
    var vendedor: Bool = false
    let repository = CarrinhoRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configuraçoes da TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //carrinho =  Singleton.shared.carrinho
        if (Singleton.shared.comercianteLogado?.enderecos.count ?? 0) > 1 {
            Singleton.shared.enderecoDeEntrega = Singleton.shared.comercianteLogado?.enderecos[0]
            Singleton.shared.carrinhoPedido?.enderecoId = Singleton.shared.enderecoDeEntrega?.id
        }
        
        if (carrinhoCriado?.itens.count ?? 0) > 3 {
            maisDeTresItems = true
        } else {
            maisDeTresItems = false
        }
        
        self.viwLoadView.isHidden = false
        // navigation controller
        
       /* if !vendedor {
            repository.getCarrinhoVendedor { (result, err) in
                if let result = result {
                    print(result)
                    DispatchQueue.main.async {
                        // Quando carregado, esconde a tela de load e atribui o valor de carrinhoData
                        self.viwLoadView.isHidden = true
                        self.carrinhoCriado = CarrinhoData.jsonToObject(dict: result as! Dictionary<String, Any>) //[[String : Any?]]
                        self.tableView.reloadData()
                    }
                } else {
                    print(err as Any)
                }
            }
        }*/
        
        if let carrinhoPedido = Singleton.shared.carrinhoPedido {
            repository.getCarrinho(carrinhoPedido: carrinhoPedido) { (result, err) in
                if let result = result {
                    print(result)
                    DispatchQueue.main.async {
                        // Quando carregado, esconde a tela de load e atribui o valor de carrinhoData
                        self.viwLoadView.isHidden = true
                        self.carrinhoCriado = CarrinhoData.jsonToObject(dict: result as! Dictionary<String, Any>)
                        self.tableView.reloadData()
                    }
                } else {
                    
                    self.viwLoadView.isHidden = true
                    let alert = UIAlertController(title: "Erro ao carregar o carrinho.", message: "Erro ao carregar o carrinho.", preferredStyle: .alert)
                    alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Ok"), style: .default, handler: { _ in
                        // Nao faz nada
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                    print(err as Any)
                }
            }
        } else {
            let alert = UIAlertController(title: "Erro ao carregar o carrinho", message: "Lembre-se de entrar em sua conta para acessar o carrinho", preferredStyle: .alert)
            alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Entrar", comment: "Default action"), style: .cancel, handler: { _ in
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
    
    
    private func finalizarPedido() {
        let emptyCart = UIAlertController(title: "Carrinho vazio", message: "Para realizar o pedido, o carrinho não pode estar vazio. Confira nossos produtos na aba Hortfruti", preferredStyle: .alert)
        let alert = UIAlertController(title: "Tudo certo!", message: "Caso algum desses produtos não esteja disponível, o que fazer?", preferredStyle: .alert)
        let successAlert = UIAlertController(title: "AOOOBA", message: "Pedido finalizado com sucesso! Você pode verificar seu pedido na aba Pedidos do nosso app", preferredStyle: .alert)
        let errorAlert = UIAlertController(title: "Erro", message: "Parece que algo deu errado durante a execução do seu pedido. Tente novamente mais tarde", preferredStyle: .alert)
        
        guard let carrinhoPedido = Singleton.shared.carrinhoPedido else { return }
        emptyCart.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        
        if carrinhoPedido.itensDoCarrinho.isEmpty {
            emptyCart.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                return
            }))
            self.present(emptyCart, animated: true, completion: nil)
        }
        alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Aceitar sugestão Aoba", comment: "aceitar sugestao"), style: .default, handler: { _ in
            if let carrinhoPedido = Singleton.shared.carrinhoPedido {
                carrinhoPedido.opcaoAlternativa = .ACEITAR_SUGESTAO
                self.repository.fazerPedido(carrinhoPedido: carrinhoPedido) { result, _ in
                    if let _ = result {
                        DispatchQueue.main.async {
                            self.viwLoadView.isHidden = true
                            successAlert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Ok"), style: .default, handler: { _ in
                                self.tabBarController?.selectedIndex = 2
                            }))
                            self.present(successAlert, animated: true, completion: nil)
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.viwLoadView.isHidden = true
                            errorAlert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Ok"), style: .default, handler: { _ in
                            }))
                            self.present(errorAlert, animated: true, completion: nil)
                        }
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.viwLoadView.isHidden = true
                    errorAlert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Ok"), style: .default, handler: { _ in
                    }))
                    self.present(errorAlert, animated: true, completion: nil)
                }
            }
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancelar produto", comment: "cancelar produto"), style: .default, handler: { _ in
            if let carrinhoPedido = Singleton.shared.carrinhoPedido {
                carrinhoPedido.opcaoAlternativa = .CANCELAR_PRODUTO
                self.repository.fazerPedido(carrinhoPedido: carrinhoPedido) { result, _ in
                    if let _ = result {
                        DispatchQueue.main.async {
                            self.viwLoadView.isHidden = true
                            successAlert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Ok"), style: .default, handler: { _ in
                                self.tabBarController?.selectedIndex = 2
                            }))
                            self.present(successAlert, animated: true, completion: nil)
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.viwLoadView.isHidden = true
                            errorAlert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Ok"), style: .default, handler: { _ in
                            }))
                            self.present(errorAlert, animated: true, completion: nil)
                        }
                    }
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension CarrinhoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if maisDeTresItems {
            return 10
        } else {
            return (carrinhoCriado?.itens.count ?? 0) + 6
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (carrinhoCriado?.itens.count ?? 0) > 3 {
            maisDeTresItems = true
        } else {
            maisDeTresItems = false
        }
        
        if maisDeTresItems {
            if indexPath.row < 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
                cell.config(produto: (carrinhoCriado?.itens[indexPath.row])!)
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "listaCompleta")
                return cell!
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "subTotal") as! SubTotalCarrinhoTableViewCell
                cell.config(valor: (carrinhoCriado?.valorTotal ?? 0.00) - (carrinhoCriado?.valorFrete ?? 0.00))
                return cell
            } else if indexPath.row == 5 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
                cell.config(endereco: Singleton.shared.enderecoDeEntrega, navigationController: self.navigationController!)
                return cell
            } else if indexPath.row == 6 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteCarrinhoTableViewCell
                cell.config(valor: carrinhoCriado?.valorFrete ?? 0.00)
                return cell
            } else if indexPath.row == 7 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "dataEntrega") as! DataEntregaTableViewCell
                if carrinhoCriado?.datasEntrega.count ?? 0 > 0 {
                    cell.config(dataEntrega: (carrinhoCriado?.datasEntrega[0].diaSemana.reallyFullName)! + " - " + (carrinhoCriado?.datasEntrega[0].data)!)
                } else {
                    cell.config(dataEntrega: " - ")
                }
                return cell
            } else if indexPath.row == 8 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                cell.config(valorTotal: carrinhoCriado?.valorTotal ?? 0)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "botao")!
                return cell
            }
        } else {
            if indexPath.row < carrinhoCriado?.itens.count ?? 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
                cell.config(produto: (carrinhoCriado?.itens[indexPath.row])!)
                return cell
            } else if indexPath.row == carrinhoCriado?.itens.count ?? 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "subTotal") as! SubTotalCarrinhoTableViewCell
                cell.config(valor: (carrinhoCriado?.valorTotal ?? 0.00) - (carrinhoCriado?.valorFrete ?? 0.00))
                return cell
            } else if indexPath.row == (carrinhoCriado?.itens.count ?? 0) + 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
                cell.config(endereco: Singleton.shared.enderecoDeEntrega, navigationController: self.navigationController!)
                return cell
            } else if indexPath.row == (carrinhoCriado?.itens.count ?? 0) + 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteCarrinhoTableViewCell
                cell.config(valor: carrinhoCriado?.valorFrete ?? 0.00)
                return cell
            } else if indexPath.row == (carrinhoCriado?.itens.count ?? 0) + 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "dataEntrega") as! DataEntregaTableViewCell
                if carrinhoCriado?.datasEntrega.count ?? 0 > 0 {
                    cell.config(dataEntrega: (carrinhoCriado?.datasEntrega[0].diaSemana.reallyFullName)! + " - " + (carrinhoCriado?.datasEntrega[0].data)!)
                } else {
                    cell.config(dataEntrega: " - ")
                }
                return cell
            } else if indexPath.row == (carrinhoCriado?.itens.count ?? 0) + 4{
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                cell.config(valorTotal: carrinhoCriado?.valorTotal ?? 0.00)
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
                
                listaCompletaController.carrinhoCriado = self.carrinhoCriado
                self.navigationController!.show(listaCompletaController, sender: self)

            
            } else if indexPath.row == 5{
                let enderecoCompradorController: EnderecoCompradorViewController!
                let enderecoCompradorView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
                enderecoCompradorController = enderecoCompradorView.instantiateViewController(identifier: "enderecos") as? EnderecoCompradorViewController
                navigationController!.showDetailViewController(enderecoCompradorController, sender: self)
                enderecoCompradorController.navigationItem.title = "Enderecos"
                enderecoCompradorController.carrinhoController = self
            
            } else if indexPath.row == 9 {
                finalizarPedido()
            }
            
        } else {
            if indexPath.row == (carrinhoCriado?.itens.count ?? 0) + 1 {
                let enderecoCompradorController: EnderecoCompradorViewController!
                let enderecoCompradorView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
                enderecoCompradorController = enderecoCompradorView.instantiateViewController(identifier: "enderecos") as? EnderecoCompradorViewController
                navigationController!.showDetailViewController(enderecoCompradorController, sender: self)
                enderecoCompradorController.navigationItem.title = "Enderecos"
                enderecoCompradorController.carrinhoController = self
            
            } else if indexPath.row == (carrinhoCriado?.itens.count ?? 0) + 5 {
                finalizarPedido()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if maisDeTresItems {
            if indexPath.row < 3 {
                return 91
            } else if indexPath.row <= 4 || indexPath.row == 6 {
                return 60
            } else if indexPath.row == 5{
                return 120
            } else if indexPath.row == 7 {
                return 100
            } else {
                return  150
            }
        } else {
            if indexPath.row <= (carrinhoCriado?.itens.count ?? 0) - 1{
                return 91
            } else if  indexPath.row == (carrinhoCriado?.itens.count ?? 0) || indexPath.row == (carrinhoCriado?.itens.count ?? 0) + 2{
                return 60
            } else if indexPath.row == (carrinhoCriado?.itens.count ?? 0) + 1{
                return 120
            } else if indexPath.row == (carrinhoCriado?.itens.count ?? 0) + 3 {
                return 100
            } else {
                return 150
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row <= (carrinhoCriado?.itens.count ?? 0) - 1 && !maisDeTresItems || indexPath.row < 3 && maisDeTresItems {
            let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
                self.carrinhoCriado?.itens.remove(at: indexPath.row)
                Singleton.shared.carrinhoPedido?.itensDoCarrinho.remove(at: indexPath.row)
                
                if (self.carrinhoCriado?.itens.count ?? 0) > 3 {
                    self.maisDeTresItems = true
                } else {
                    self.maisDeTresItems = false
                }
                
                
                self.viwLoadView.isHidden = false
                if let carrinhoPedido = Singleton.shared.carrinhoPedido {
                    self.repository.getCarrinho(carrinhoPedido: carrinhoPedido) { (result, err) in
                        if let result = result {
                            print(result)
                            DispatchQueue.main.async {
                                // Quando carregado, esconde a tela de load e atribui o valor de carrinhoData
                                self.viwLoadView.isHidden = true
                                self.carrinhoCriado = CarrinhoData.jsonToObject(dict: result as! Dictionary<String, Any>)
                                self.tableView.reloadData()
                            }
                        } else {
                            print(err as Any)
                            self.viwLoadView.isHidden = true
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
        return nil
    }
}
