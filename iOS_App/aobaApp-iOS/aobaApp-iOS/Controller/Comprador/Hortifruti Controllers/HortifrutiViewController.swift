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
    
    var secoes: [AtivosSecao]! = []
    let classificadorDeSecoes = ClassificadorDeSecoes()
    var modoDeApresetacao: ModoDeApresentacao!
    var diaDaSemana: String?
    var nomeDaSecaoFVL: String?
    
    
    func initObjeto(){
        // request da API
        if modoDeApresetacao == ModoDeApresentacao.diasDaSemana {
            let segunda = classificadorDeSecoes.getCategoriasPelodiaDaSemana(anuncios: Singleton.shared.anuncios, nomeDaSecao: nomeDaSecaoFVL!, diaDaSemana: "SEG")
            let terca = classificadorDeSecoes.getCategoriasPelodiaDaSemana(anuncios: Singleton.shared.anuncios, nomeDaSecao: nomeDaSecaoFVL!, diaDaSemana: "TER")
            let quarta = classificadorDeSecoes.getCategoriasPelodiaDaSemana(anuncios: Singleton.shared.anuncios, nomeDaSecao: nomeDaSecaoFVL!, diaDaSemana: "QUA")
            let quinta = classificadorDeSecoes.getCategoriasPelodiaDaSemana(anuncios: Singleton.shared.anuncios, nomeDaSecao: nomeDaSecaoFVL!, diaDaSemana: "QUI")
            let sexta = classificadorDeSecoes.getCategoriasPelodiaDaSemana(anuncios: Singleton.shared.anuncios, nomeDaSecao: nomeDaSecaoFVL!, diaDaSemana: "SEX")
            
            
            segunda != nil ? secoes.append(segunda!) : print("nao conem produtos")
            terca != nil ? secoes.append(terca!) : print("nao conem produtos")
            quarta != nil ? secoes.append(quarta!) : print("nao conem produtos")
            quinta != nil ? secoes.append(quinta!) : print("nao conem produtos")
            sexta != nil ? secoes.append(sexta!) : print("nao conem produtos")
        }
            
            
        else if modoDeApresetacao == ModoDeApresentacao.fvl {
            let frutas = classificadorDeSecoes.getCategoriaPelaSecao(anuncios: Singleton.shared.anuncios, nomeDaSecao: "FRUTAS", diaDaSemana: diaDaSemana!)
            let verduras = classificadorDeSecoes.getCategoriaPelaSecao(anuncios: Singleton.shared.anuncios, nomeDaSecao: "VERDURAS", diaDaSemana: diaDaSemana!)
            let legumes = classificadorDeSecoes.getCategoriaPelaSecao(anuncios: Singleton.shared.anuncios, nomeDaSecao: "LEGUMES", diaDaSemana: diaDaSemana!)
            
            
            
            frutas != nil ? secoes.append(frutas!) : print("nao contem produtos")
            verduras != nil ? secoes.append(verduras!) : print("nao conem produtos")
            legumes != nil ? secoes.append(legumes!) : print("nao conem produtos")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initObjeto()
        
        
        
        // Tableview Configure
        tableView.register(HortifrutiTableViewCell.nib(), forCellReuseIdentifier: HortifrutiTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        //Navbar and search item
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Busque aqui seu produto"
        navigationItem.searchController = searchController
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    // Quantidade de categorias + 1 devido ao título (Frutas + verduras + Legumes + 1 = 4)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secoes.count + 1
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
            
            cell.configure(title: secoes[indexPath.row-1].secao, produtos: secoes[indexPath.row-1].categorias)
            cell.navigationController = self.navigationController
            
            
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


enum ModoDeApresentacao {
    case diasDaSemana
    case fvl
}
