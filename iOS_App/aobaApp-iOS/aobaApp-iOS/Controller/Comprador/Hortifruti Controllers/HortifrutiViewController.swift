//
//  HortfruitsViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 14/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit
import Foundation

class HortifrutiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var frutas: [Dictionary<String, String>]!
    var verduras: [Dictionary<String, String>]!
    var legumes: [Dictionary<String, String>]!
    var fruta = TipoProduto(nome: "Fruta")
    var verdura = TipoProduto(nome: "Verdura")
    var legume = TipoProduto(nome: "Legume")
    var categorias : [[CategoriaProduto]] = []
    
    
    
    func initObjeto(){
        categorias = [
            [
                CategoriaProduto(nome: "Abacate", foto: "fruta-abacate", tipoProduto: fruta),
                CategoriaProduto(nome: "Mamão", foto: "fruta-mamao", tipoProduto: fruta),
                CategoriaProduto(nome: "Maça", foto: "fruta-maca", tipoProduto: fruta),
                CategoriaProduto(nome: "Banana", foto: "fruta-banana", tipoProduto: fruta),
                CategoriaProduto(nome: "Laranja", foto: "fruta-laranja", tipoProduto: fruta)
            ],
            [
                CategoriaProduto(nome:"Couve-flor", foto: "verdura-couveflor", tipoProduto: verdura),
                CategoriaProduto(nome: "Brocolis", foto: "verdura-brocolis", tipoProduto: verdura),
                CategoriaProduto(nome: "Alface", foto: "verdura-alface", tipoProduto: verdura),
            ],
            [
                CategoriaProduto(nome: "Beterraba", foto: "legume-beterraba", tipoProduto: legume),
                CategoriaProduto(nome: "Milho", foto: "legume-milho", tipoProduto: legume),
                CategoriaProduto(nome: "Rabanete", foto: "legume-rabanete", tipoProduto: legume),
            ]
        ]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initObjeto()
        // TableView
        tableView.register(HortifrutiTableViewCell.nib(), forCellReuseIdentifier: HortifrutiTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        //Navbar and search item
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Busque aqui seu produto"
        navigationItem.searchController = searchController
        
        frutas = [
            ["name": "Abacaxi", "image-name": "fruta-abacaxi"],
            ["name": "Abacate", "image-name": "fruta-abacate"],
            ["name": "Mamão", "image-name": "fruta-mamao"],
            ["name": "Maça", "image-name": "fruta-maca"],
            ["name": "Banana", "image-name": "fruta-banana"],
            ["name": "Laranja", "image-name": "fruta-laranja"],
        ]
        
        verduras = [
            ["name": "Couve-flor", "image-name": "verdura-couveflor"],
            ["name": "Brocolis", "image-name": "verdura-brocolis"],
            ["name": "Alface", "image-name": "verdura-alface"],
            ["name": "Couve-flor", "image-name": "verdura-couveflor"],
            ["name": "Brocolis", "image-name": "verdura-brocolis"],
            ["name": "Alface", "image-name": "verdura-alface"],
        ]
        
        legumes = [
            ["name": "Beterraba", "image-name": "legume-beterraba"],
            ["name": "Milho", "image-name": "legume-milho"],
            ["name": "Rabanete", "image-name": "legume-rabanete"],
            ["name": "Beterraba", "image-name": "legume-beterraba"],
            ["name": "Milho", "image-name": "legume-milho"],
            ["name": "Rabanete", "image-name": "legume-rabanete"],
        ]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    // Quantidade de categorias + 1 devido ao título (Frutas + verduras + Legumes + 1 = 4)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // Populando as células
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            
            let cell = UITableViewCell()
            let avisoDeFechamento = AvisoDeFechamentoView()
            avisoDeFechamento.draw(CGRect())

            
            cell.addSubview(avisoDeFechamento)
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: HortifrutiTableViewCell.identifier, for: indexPath) as! HortifrutiTableViewCell
            
            if indexPath.row == 1 {
                cell.configure(title: "Frutas", produtos: frutas)
                cell.navigationController = self.navigationController
            } else if indexPath.row == 2 {
                cell.configure(title: "Verduras", produtos: verduras)
                cell.navigationController = self.navigationController
            } else {
                cell.configure(title: "Legumes", produtos: legumes)
                cell.navigationController = self.navigationController
            }
            return cell
        }
    }
       
    
    // Determinando o tamanho das células
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellsize = 200
        if indexPath.row == 0 {
            cellsize = 49  //Para a primeira celula: "Selecionados para você"
        }
        
        return CGFloat(cellsize)
    }
    
    
    
   
    

}
