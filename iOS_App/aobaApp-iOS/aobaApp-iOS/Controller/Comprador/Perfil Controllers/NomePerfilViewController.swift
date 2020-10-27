//
//  NomePerfilViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class NomePerfilViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtNomeFantasia: UITextField!
    @IBOutlet weak var btnCancelar: UIButton!
    @IBOutlet weak var btnAlterar: UIButton!
    @IBOutlet weak var viewLoadView: UIView!
    
    private let repository = CompradorRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNome.text = Singleton.shared.comercianteLogado?.nome
        txtNomeFantasia.text = Singleton.shared.comercianteLogado?.nomeFantasia
        viewLoadView.isHidden = true
    }

    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAlterarPressed(_ sender: Any) {
        let perfil = PerfilData(emailAntigo: nil, emailNovo: nil, nome: txtNome.text, nomeFantasia: txtNomeFantasia.text, senhaAntiga: nil, novaSenha: nil)
        
        repository.editarPerfil(perfil: perfil)
    }
}
