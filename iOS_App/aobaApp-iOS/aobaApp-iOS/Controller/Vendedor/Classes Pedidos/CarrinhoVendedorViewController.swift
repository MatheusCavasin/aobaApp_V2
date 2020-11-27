//
//  CarrinhoVendedorViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 16/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class CarrinhoVendedorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viwLoadView: UIView!
    
    let repository = ProdutorRepository()
    var itens = [[String : Any?]]()
    var datasEntrega = [[String : Any?]]()
    var dadosComerciante: ComercianteData!
    var maisDeTresItems = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viwLoadView.isHidden = false
        
        repository.getCarrinhoVendedor { (result, err) in
            if let result = result {
                //                print(result)
                ModelVendedor.instance.dictListaCarrinho = result as! [[String : Any?]]
                DispatchQueue.main.async {
                    // Quando carregado, esconde a tela de load e atribui o valor de carrinhoData
                    self.itens = ModelVendedor.instance.dictListaCarrinho[0]["itens"] as! [[String : Any?]]
                    self.datasEntrega = ModelVendedor.instance.dictListaCarrinho[0]["datasEntrega"] as! [[String : Any?]]
                    print("\n\n\n\n\(ModelVendedor.instance.dictListaCarrinho)\n\n\n\n\n")
                    print("\n\n aAAAAAAAQUIIIIII  \n")
                    print(self.itens.count)
                    print(ModelVendedor.instance.dictListaCarrinho[0]["datasEntrega"] as! [[String : Any?]])
                    
                    self.dadosComerciante = ComercianteData.dictToObject(dict: (ModelVendedor.instance.dictListaCarrinho[0]["comerciante"] as! Dictionary<String,Any>))
//                    print("\n\n\n")
//                    print("AQUI!!")
//                    print("\n\n\n\n\n \(ModelVendedor.instance.dictListaCarrinho[0]["comerciante"] as! Dictionary<String,Any>)\n\n\n\n")
//                    print("\n\n\n\n\n \(self.dadosComerciante)\n\n\n\n")
//                    print("\n\n\n\n\n \(self.dadosComerciante.nome)\n\n\n\n")
//                    print("\n\n\n\n\n \(self.dadosComerciante.enderecos)\n\n\n\n")
//                    print("\n\n\n\n\n \(self.dadosComerciante.enderecos)\n\n\n\n")
//                    print("AQUI!!")
                    
                    if self.itens.count > 3 {
                        self.maisDeTresItems = true
                    } else {
                        self.maisDeTresItems = false
                    }
                    
                    
                    self.viwLoadView.isHidden = true
                    self.tableView.reloadData()
                }
            } else {
                print(err as Any)
            }
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if maisDeTresItems {
            return 10
        } else {
            return ((itens.count ?? 0) + 6)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "listaCompleta")
        //        return cell!
        
        print(self.itens.count)
        print("AQUI!! \n\n\n\n")
        
        if maisDeTresItems {
            if indexPath.row < 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
//                cell.configVendedor(produto: self.itens[indexPath.row], data: self.datasEntrega)
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "listaCompleta")
                return cell!
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "subTotal") as! SubTotalCarrinhoTableViewCell
                if ModelVendedor.instance.dictListaCarrinho.isEmpty {
                    cell.config(valor: 0.00)
                } else {
                    cell.config(valor: (ModelVendedor.instance.dictListaCarrinho[0]["valorTotal"] as? Float ?? 0.00) - (ModelVendedor.instance.dictListaCarrinho[0]["valorFrete"] as? Float ?? 0.00))
                }
                return cell
            } else if indexPath.row == 5 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
                if !ModelVendedor.instance.dictListaCarrinho.isEmpty {
                    cell.config(endereco: self.dadosComerciante.enderecos[0], navigationController: self.navigationController!)
                }
                return cell
            } else if indexPath.row == 6 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteCarrinhoTableViewCell
                if ModelVendedor.instance.dictListaCarrinho.isEmpty {
                    cell.config(valor: 0.00)
                } else {
                    cell.config(valor: ModelVendedor.instance.dictListaCarrinho[0]["valorFrete"] as! Float)
                }
                return cell
            } else if indexPath.row == 7 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "dataEntrega") as! DataEntregaTableViewCell
                if datasEntrega.count > 0 {
                    cell.config(dataEntrega: (datasEntrega[0]["diaSemana"] as! String) + " - " + (datasEntrega[0]["data"] as! String))
                } else {
                    cell.config(dataEntrega: " - ")
                }
                return cell
            } else if indexPath.row == 8 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                if ModelVendedor.instance.dictListaCarrinho.isEmpty {
                    cell.config(valorTotal: 0.00)
                } else {
                    cell.config(valorTotal: ModelVendedor.instance.dictListaCarrinho[0]["valorTotal"] as! Float)
                }
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "botao")!
                return cell
            }
        } else {
            if indexPath.row < self.itens.count {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier) as! ProdutoCarrinhoTableViewCell
                if !ModelVendedor.instance.dictListaCarrinho.isEmpty {
                    cell.configVendedor(produto: self.itens[indexPath.row], data: self.datasEntrega)
                }
                return cell
            } else if indexPath.row == self.itens.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "subTotal") as! SubTotalCarrinhoTableViewCell
                if ModelVendedor.instance.dictListaCarrinho.isEmpty {
                    cell.config(valor: 0.00)
                } else {
                    cell.config(valor: (ModelVendedor.instance.dictListaCarrinho[0]["valorTotal"] as? Float ?? 0.00))
                }
                
                return cell
            } else if indexPath.row == (self.itens.count ?? 0) + 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
                if !ModelVendedor.instance.dictListaCarrinho.isEmpty {
                    cell.config(endereco: self.dadosComerciante.enderecos[0], navigationController: self.navigationController!)
                }
                return cell
            } else if indexPath.row == self.itens.count + 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteCarrinhoTableViewCell
                if ModelVendedor.instance.dictListaCarrinho.isEmpty {
                    cell.config(valor: 0.00)
                } else {
                    cell.config(valor: ModelVendedor.instance.dictListaCarrinho[0]["valorFrete"] as! Float)
                }
                return cell
            } else if indexPath.row == self.itens.count + 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "dataEntrega") as! DataEntregaTableViewCell
                if datasEntrega.count > 0 {
                    cell.config(dataEntrega: (datasEntrega[0]["diaSemana"] as! String) + " - " + (datasEntrega[0]["data"] as! String))
                } else {
                    cell.config(dataEntrega: " - ")
                }
                return cell
            } else if indexPath.row == self.itens.count + 4{
                let cell = tableView.dequeueReusableCell(withIdentifier: "total") as! TotalDoPedidoTableViewCell
                if ModelVendedor.instance.dictListaCarrinho.isEmpty {
                    cell.config(valorTotal: 0.00)
                } else {
                    cell.config(valorTotal:(ModelVendedor.instance.dictListaCarrinho[0]["valorTotal"] as? Float ?? 0.00) + (ModelVendedor.instance.dictListaCarrinho[0]["valorFrete"] as? Float ?? 0.00))
                }
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "botao")!
                return cell
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        
        if maisDeTresItems {
            if indexPath.row == 3 {
                let listaCompletaController: ListaCompletaVendedorTableViewController!
                let listaCompletaView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
                listaCompletaController = listaCompletaView.instantiateViewController(identifier: "todosOsProdutos") as? ListaCompletaVendedorTableViewController
                
                listaCompletaController.itens = self.itens
                listaCompletaController.datasEntrega = self.datasEntrega
                self.navigationController!.show(listaCompletaController, sender: self)

            
            } else if indexPath.row == 9 {
                let alert = UIAlertController(title: "AOOOBA", message: "Pedido realizado com sucesso. Agora é só aguardar ele chegar até você", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
            }
            
        } else if indexPath.row == self.itens.count + 5 {
            
            let listaCompletaController: ListaCompletaVendedorTableViewController!
            let listaCompletaView = UIStoryboard(name: "TabPedidosVendedor", bundle: nil)
            listaCompletaController = listaCompletaView.instantiateViewController(identifier: "todosOsProdutosVendedor") as? ListaCompletaVendedorTableViewController
            
            listaCompletaController.itens = self.itens
            listaCompletaController.datasEntrega = self.datasEntrega
            self.navigationController!.show(listaCompletaController, sender: self)
            /*
            let alert = UIAlertController(title: "Pedido Cancelado", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                print("Cancelar Pedido")
                self.dismiss(animated: false, completion: nil)
            }))
            alert.view.tintColor = #colorLiteral(red: 1, green: 0.5716887116, blue: 0.1306569278, alpha: 1)
            self.present(alert, animated: true, completion: nil)
             */
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
            if indexPath.row <= (itens.count) - 1{
                return 91
            } else if  indexPath.row == (itens.count) || indexPath.row == (itens.count) + 2{
                return 60
            } else if indexPath.row == (itens.count) + 1{
                return 120
            } else if indexPath.row == (itens.count) + 3 {
                return 100
            } else {
                return 150
            }
        }
    }

    
    
    
    
    
}
