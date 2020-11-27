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
    fileprivate var pedidosPassados: [PedidoData]?
    fileprivate var pedidosEmAndamento: [PedidoData]?
    
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
        
        if Singleton.shared.comercianteLogado == nil {
            let alert = UIAlertController(title: "Erro ao carregar pedidos", message: "Lembre-se de entrar em sua conta para acessar os pedidos", preferredStyle: .alert)
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
        } else {
            LoadView.shared.showLoadView(self.view)
            repository.getPedidosComerciante { (result, err) in
                guard result != nil else { return }
                Singleton.shared.pedidos = result as? [PedidoData]
                self.pedidosPassados = self.getPedidosPassados()
                self.pedidosEmAndamento = self.getPedidosEmAndamento()
                LoadView.shared.hideLoadView()
                DispatchQueue.main.async {
                    self.pedidosTableView.reloadData()
                    self.pedidosPassadosTableView.reloadData()
                }
            }
        }
        
        
    }
    
    public func reloadView() {
        self.pedidosPassados = self.getPedidosPassados()
        self.pedidosEmAndamento = self.getPedidosEmAndamento()
        self.pedidosTableView.reloadData()
        self.pedidosPassadosTableView.reloadData()
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
    
    fileprivate func getPedidosPassados() -> [PedidoData]? {
        return Singleton.shared.pedidos?.filter( {$0.status == StatusPedido.entregue} )
    }
    
    fileprivate func getPedidosEmAndamento() -> [PedidoData]? {
        return Singleton.shared.pedidos?.filter( {$0.status != StatusPedido.entregue} )
    }
}


extension PedidosViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == pedidosPassadosTableView {
            return pedidosPassados?.count ?? 0
        } else {
            return pedidosEmAndamento?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == pedidosPassadosTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetalhesDoPedidoTableViewCell.identifier) as! DetalhesDoPedidoTableViewCell
            cell.config(mainText: "Detalhes do pedido #\(indexPath.row)", dataText: "28/10/2020", pedido: (pedidosPassados?[indexPath.row])!)
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PedidoEmAndamentoTableViewCell.identifier) as! PedidoEmAndamentoTableViewCell
            cell.config(defaultColor: #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1), pedido: pedidosEmAndamento![indexPath.row])
            cell.setMainTexts(firstField: "Realizado", secondField: "Confirmado", thirdField: "Entregue")
            cell.setStatus(status: pedidosEmAndamento?[indexPath.row].status ?? .pendente)
            cell.controller = self
            cell.confirmButtonPressed = { [weak self] in
                guard let self = self else { return }
                LoadView.shared.showLoadView(self.view)
                self.pedidosEmAndamento![indexPath.row].status = .entregue
                let pedidoId = self.pedidosEmAndamento![indexPath.row].pedidoId
                self.reloadView()
                self.repository.confirmarEntrega(pedidoId: pedidoId) { (result, err) in
                    LoadView.shared.hideLoadView()
                }
            }
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
        let view = UIStoryboard(name: "TabPedidosComprador", bundle: nil)
        let controller: DetalhesDoPedidoViewController!
        controller = view.instantiateViewController(identifier: "detalhesComprador") as? DetalhesDoPedidoViewController
        if tableView == pedidosPassadosTableView {
            controller.pedido = pedidosPassados?[indexPath.row]
        } else {
            controller.pedido = pedidosEmAndamento?[indexPath.row]
        }
        navigationController?.showDetailViewController(controller, sender: self)
    }
}

