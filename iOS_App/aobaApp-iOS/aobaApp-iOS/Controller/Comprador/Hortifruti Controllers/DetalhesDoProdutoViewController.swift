//
//  DetalhesDoProdutoViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 19/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class DetalhesDoProdutoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnCancelar: UIBarButtonItem!
    var produto: Dictionary<String, Any>! = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "image") as! ImageTableViewCell
            cell.congif(imageName: produto["imagem"] as! String)
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title") as! TitleTableViewCell
            cell.config(nome: produto["titulo"] as! String, preco: Float(produto["preco"] as! Double))
            return cell
        }
        
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fazenda") as! FazendaTableViewCell
            cell.config(nomeFazenda: produto["produtor"] as! String, avaliacao: Float(produto["avaliação do produtor"] as! Double))
            return cell
        }
        
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "caixasDisponiveis") as! CaixasDisponivelsTableViewCell
            cell.config(quantidadeDisponivel: produto["quantidadeDisponiel"] as! Int)
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "quantidade") as! QuantidadeTableViewCell
        cell.presentView = self
        cell.config(produto: produto)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 260
        } else if indexPath.row == 1 {
            return 95
        } else if indexPath.row == 2 {
            return 45
        } else if indexPath.row == 3 {
            return 80
        }
        return 363
        
    }
}
