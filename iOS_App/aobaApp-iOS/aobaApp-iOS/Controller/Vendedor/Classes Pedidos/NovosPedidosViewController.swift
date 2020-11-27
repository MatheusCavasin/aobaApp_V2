//
//  NovosPedidosViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 27/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class NovosPedidosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellsAnuncioDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var itens = [[String : Any?]]()
    var produtor = [String : Any?]()
    let repository: ProdutorRepository = ProdutorRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(produtosConfirmarPedidoTableViewCell.nib(), forCellReuseIdentifier: produtosConfirmarPedidoTableViewCell.identifier)
        tableView.register(NovosPedidoTableViewCell.nib(), forCellReuseIdentifier: NovosPedidoTableViewCell.identifier)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NovosPedidoTableViewCell", for: indexPath) as! NovosPedidoTableViewCell
            cell.configVendedor(produto: produtor)
            return cell
        } else if indexPath.row <= itens.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: produtosConfirmarPedidoTableViewCell.identifier) as! produtosConfirmarPedidoTableViewCell
            cell.configVendedor(iten: itens[indexPath.row - 1] as! [String : Any?])
            return cell
        } else {
         let cell = tableView.dequeueReusableCell(withIdentifier: "confirmarPedidoCell", for: indexPath) as! confirmarPedidoCell
         cell.delegate = self
         return cell
        }
        
    }
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    if indexPath.row == 0 {
        return 140
    } else if indexPath.row <= itens.count {
        return 90
    }
    else {
        return 60
    }
}
    
    

    func recusarPedidoPressed() {
        print("RECUSAR")
        repository.responderPedido(pedidoId: (produtor["idPedido"] as! Int), aceite: false, completion: {_,_ in })
        NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationID5"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    func aceitarPedidoPressed() {
        print("ACEITAR")
        repository.responderPedido(pedidoId: (produtor["idPedido"] as! Int), aceite: true, completion: {_,_ in })
        NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationID5"), object: nil)
        self.dismiss(animated: true, completion: nil)

    }
    
}
