//
//  PedidosViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PedidosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var viewEmAndamento: PedidoEmAndamentoView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentationControl()
        setupPedidoEmAndamento()
        setupPedidoPassados()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
    }
    
    func setupSegmentationControl() {
        segmentedControl.setTitle("Em andamento", forSegmentAt: 0)
        segmentedControl.setTitle("Passados", forSegmentAt: 1)
    }
    
    func setupPedidoEmAndamento() {
        viewEmAndamento.setDefaultColor(color: #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1))
        viewEmAndamento.setStatus(status: .confirmado)
        viewEmAndamento.setMainTexts(firstField: "Realizado", secondField: "Confirmado", thirdField: "Entregue")
        viewEmAndamento.setDataText(firstField: "19/08/2020 • 11h45", secondField: "19/08/2020 • 11h45", thirdField: "19/08/2020 • 11h45")
    }
    
    func setupPedidoPassados() {
        tableView.register(AvaliarPedidosTableViewCell.nib(), forCellReuseIdentifier: AvaliarPedidosTableViewCell.identifier)
        tableView.register(DetalhesDoPedidoTableViewCell.nib(), forCellReuseIdentifier: DetalhesDoPedidoTableViewCell.identifier)
        
        tableView.separatorStyle = .none
    }


    @IBAction func segmentedControlChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewEmAndamento.isHidden = false
            tableView.isHidden = true
        case 1:
            viewEmAndamento.isHidden = true
            tableView.isHidden = false
        default:
            break
        }
    }
}


extension PedidosViewController {   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: AvaliarPedidosTableViewCell.identifier) as! AvaliarPedidosTableViewCell
            cell.config(text: "Avalie seus pedidos passados", color: #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1))
            return cell
        
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetalhesDoPedidoTableViewCell.identifier) as! DetalhesDoPedidoTableViewCell
            cell.config(mainText: "Detalhes do pedido #\(indexPath.row)", dataText: "28/10/2020")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false //Melhora a navegaçao
    }
    
}


enum StatusPedido {
    case realizado
    case confirmado
    case entregue
}
