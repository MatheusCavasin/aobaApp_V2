//
//  MenuViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 09/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var seg: DiaDaSemanaView!
    @IBOutlet weak var ter: DiaDaSemanaView!
    @IBOutlet weak var qua: DiaDaSemanaView!
    @IBOutlet weak var qui: DiaDaSemanaView!
    @IBOutlet weak var sex: DiaDaSemanaView!
    
    @IBOutlet weak var imgFrutas: CardOQueProcura!
    @IBOutlet weak var imgVerduras: CardOQueProcura!
    @IBOutlet weak var imgLegumes: CardOQueProcura!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation Bar
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchBar.placeholder = "Busque aqui seu produto"
//        navigationItem.searchController = searchController
        
        //Tela
        setupDiasDaSemanaView()
        setupImagensDasCategorias()
    }
    
    
    private func setupDiasDaSemanaView() {
        self.seg.setupView("Segunda", presentingController: self)
        self.ter.setupView("Terça", presentingController: self)
        self.qua.setupView("Quarta", presentingController: self)
        self.qui.setupView("Quinta", presentingController: self)
        self.sex.setupView("Sexta", presentingController: self)
    }
    
    private func setupImagensDasCategorias() {
        imgFrutas.setupView("FRUTA", presentingController: self)
        imgLegumes.setupView("VERDURA", presentingController: self)
        imgVerduras.setupView("LEGUME", presentingController: self)
    }
}
