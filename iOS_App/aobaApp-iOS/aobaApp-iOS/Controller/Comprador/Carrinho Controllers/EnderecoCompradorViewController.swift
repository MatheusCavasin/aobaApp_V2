//
//  EnderecoCompradorViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class EnderecoCompradorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var enderecosComerciante: [EnderecoData]?
    var enderecoCarrinho: EnderecoData?
    var celulaSelecionada: Int?
    var carrinhoController: CarrinhoViewController?
    
    
    @IBOutlet weak var btnVoltar: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        // Registro das celulas
        tableView.register(EnderecoCadastradoTableViewCell.nib(), forCellReuseIdentifier: EnderecoCadastradoTableViewCell.identifier)
    
                
        // Inicializaçao das variáveis
        enderecosComerciante = Singleton.shared.comercianteLogado?.enderecos
        enderecoCarrinho = Singleton.shared.carrinho.endereco
    }

    func reloadData() {
        // Inicializaçao das variáveis
        enderecosComerciante = Singleton.shared.comercianteLogado?.enderecos
        enderecoCarrinho = Singleton.shared.carrinho.endereco
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (enderecosComerciante?.count ?? 0) + 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < (enderecosComerciante?.count ?? 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: EnderecoCadastradoTableViewCell.identifier) as! EnderecoCadastradoTableViewCell
            cell.config(endereco: enderecosComerciante![indexPath.row])
            cell.isSelected = true
            return cell
        }
        
        else {
            return tableView.dequeueReusableCell(withIdentifier: "button")! as UITableViewCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if indexPath.row < (enderecosComerciante?.count ?? 0) {
            Singleton.shared.carrinho.endereco = enderecosComerciante![indexPath.row]
            Singleton.shared.carrinhoPedido?.enderecoId = Singleton.shared.carrinho.endereco!.id
            self.carrinhoController?.tableView.reloadData()
            tableView.reloadData()
            tableView.cellForRow(at: indexPath)?.isSelected = true
         } else {
            let novoEnderecoController: NovoEnderecoViewController!
            let novoEnderecoView = UIStoryboard(name: "TabCarrinhoComprador", bundle: nil)
            
            novoEnderecoController = novoEnderecoView.instantiateViewController(identifier: "novoEndereco") as? NovoEnderecoViewController
            
            novoEnderecoController.presentingController = self
            self.showDetailViewController(novoEnderecoController, sender: nil)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < (enderecosComerciante?.count ?? 0) {
            return 80
        } else {
            
            return 100
        }
    }

    @IBAction func btnVoltarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
}
