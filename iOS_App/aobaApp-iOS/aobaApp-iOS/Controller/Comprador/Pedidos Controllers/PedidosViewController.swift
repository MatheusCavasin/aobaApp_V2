//
//  PedidosViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PedidosViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var pedidosPassadosTableView: UITableView!
    @IBOutlet weak var pedidosTableView: UITableView!
    fileprivate let repository = PedidosRepository()
    
    override func viewDidLoad() {
        setupSegmentationControl()
        setupPedidoEmAndamento()
        setupPedidoPassados()
        
        pedidosPassadosTableView.delegate = self
        pedidosPassadosTableView.dataSource = self
        pedidosPassadosTableView.isHidden = true
        
        pedidosTableView.delegate = self
        pedidosTableView.dataSource = self
        pedidosTableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        repository.getPedidosComerciante { (result, err) in
            guard result != nil else { return }
        }
    }
    
    func setupSegmentationControl() {
        segmentedControl.setTitle("Em andamento", forSegmentAt: 0)
        segmentedControl.setTitle("Passados", forSegmentAt: 1)
    }
    func setupPedidoEmAndamento() {
        pedidosTableView.register(PedidoEmAndamentoTableViewCell.nib(), forCellReuseIdentifier: PedidoEmAndamentoTableViewCell.identifier)
        pedidosPassadosTableView.separatorStyle = .none
    }
    
    func setupPedidoPassados() {
        pedidosPassadosTableView.register(AvaliarPedidosTableViewCell.nib(), forCellReuseIdentifier: AvaliarPedidosTableViewCell.identifier)
        pedidosPassadosTableView.register(DetalhesDoPedidoTableViewCell.nib(), forCellReuseIdentifier: DetalhesDoPedidoTableViewCell.identifier)
        pedidosPassadosTableView.separatorStyle = .none
    }

    @IBAction func segmentedControlChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            pedidosTableView.isHidden = false
            pedidosPassadosTableView.isHidden = true
        case 1:
            pedidosTableView.isHidden = true
            pedidosPassadosTableView.isHidden = false
        default:
            break
        }
    }
}


extension PedidosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == pedidosPassadosTableView {
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
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PedidoEmAndamentoTableViewCell.identifier) as! PedidoEmAndamentoTableViewCell
            cell.config(defaultColor: #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1))
            cell.setStatus(status: .realizado)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == pedidosPassadosTableView {
            return 100
        } else {
            return 424
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false //Melhora a navegaçao
    }
    
}

