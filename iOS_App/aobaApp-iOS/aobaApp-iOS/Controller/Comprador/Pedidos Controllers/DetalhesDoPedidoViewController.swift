//
//  DetalhesDoPedidoTableViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class DetalhesDoPedidoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var pedido: PedidoData!
    var itens: [ItemData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(ProdutoCarrinhoTableViewCell.nib(), forCellReuseIdentifier: ProdutoCarrinhoTableViewCell.identifier)
        self.itens = pedido.detalhes.itens.map { (item) -> ItemData in
            ItemData(
                anuncioId: item.id,
                dataEntrega: DataEntregaData(data: item.entrega.dia!, diaSemana: DiaSemana.fromString(string: item.entrega.dia!)!),
                foto: item.foto,
                quantidade: item.qtde,
                valor: item.valor,
                nome: item.nomeItem
            )
        }
    }
        
    @IBAction func btnCancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DetalhesDoPedidoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pedido.detalhes.itens.count + 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == pedido.detalhes.itens.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "subTotal") as! SubTotalCarrinhoTableViewCell
            cell.config(valor: pedido.detalhes.totalItens)
            return cell
        } else if indexPath.row == pedido.detalhes.itens.count + 1 {
            let cidadeUF = pedido.detalhes.endereco.cidadeUf.components(separatedBy: "-")
            let cidade = cidadeUF[0]
            let uf = cidadeUF[1]
            
            let logradouraNumero = pedido.detalhes.endereco.logradouroNumero.components(separatedBy: ",")
            let logradoura = logradouraNumero[0]
            let numero = Int(logradouraNumero[1].replacingOccurrences(of: " ", with: ""))

            let cell = tableView.dequeueReusableCell(withIdentifier: "endereco") as! EnderecoDoCarrinhoTableViewCell
            let endereco =
                EnderecoData(
                    bairro: pedido.detalhes.endereco.bairro,
                    cep: "",
                    cidade: cidade,
                    complemento: "",
                    id: 0,
                    latitude: 0,
                    longitude: 0,
                    logradouro: logradoura,
                    numero: numero ?? 0 ,
                    uf: uf
                )
            cell.config(endereco: endereco, navigationController: nil)
            return cell
        } else if indexPath.row == pedido.detalhes.itens.count + 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "valorFrete") as! ValorFreteCarrinhoTableViewCell
            cell.config(valor: pedido.detalhes.totalFrete)
            return cell
        } else if indexPath.row == pedido.detalhes.itens.count + 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TotalPedidoTableViewCell.identifier) as! TotalPedidoTableViewCell
            cell.config(valor: pedido.detalhes.totalPedido)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProdutoCarrinhoTableViewCell.identifier, for: indexPath) as! ProdutoCarrinhoTableViewCell
            cell.config(produto: itens[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableSize = pedido.detalhes.itens.count
        
        if indexPath.row == tableSize || indexPath.row == tableSize + 2 || indexPath.row == tableSize + 3{
            return 60
        } else if indexPath.row == tableSize + 1 {
            return 120
        } else {
            return 91
        }
    }
}

