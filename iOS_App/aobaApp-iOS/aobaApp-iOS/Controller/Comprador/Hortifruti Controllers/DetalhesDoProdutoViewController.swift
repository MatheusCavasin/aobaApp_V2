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
    var anuncio: AtivosAnuncio!
    var nomeDoProduto: String!
    
    var quantidade: Int?
    
    
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
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "image") as! ImageTableViewCell
            cell.congif(imageName: "logo.png")
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title") as! TitleTableViewCell
            cell.config(nome: nomeDoProduto, preco: Float(anuncio.valor))
            return cell
        }
        
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "fazenda") as! FazendaTableViewCell
            cell.config(nomeFazenda: anuncio.produtor.codigoProdutor, avaliacao: Float(5.0))
            return cell
        }
        
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "caixasDisponiveis") as! CaixasDisponivelsTableViewCell
            cell.config(quantidadeDisponivel: anuncio.qtdeMax)
            return cell
        }
        
        else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "quantidade") as! QuantidadeTableViewCell
            cell.presentView = self
            cell.config(anuncio: anuncio, controller: self)
            
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "botaoAdicionar") as! BotaoAdicionar
            cell.config(quantidade: self.quantidade ?? 0, anuncio: self.anuncio, nomeProduto: self.nomeDoProduto)
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 5 {
            if Singleton.shared.loggedIn {
                self.dismiss(animated: true, completion: nil)
                // Adiciona o produto no carrinho
            }
            
            else {
            
                let loginView = UIStoryboard(name: "CadastroComprador", bundle: nil)
                
                let loginController = loginView.instantiateViewController(identifier: "login")
                tableView.cellForRow(at: indexPath)?.isSelected = false
                loginController.modalPresentationStyle = .fullScreen
                
                
                self.show(loginController, sender: self)
                
                
                
                
            }
            
            

           
            
        }
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
        } else if indexPath.row == 4 {
            return 180
        } else {
            return 44
        }
    }
}
