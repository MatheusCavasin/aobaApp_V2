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
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.apresentarSucesso), name: NSNotification.Name(rawValue: "PerfilEditado"), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.apresentarErro), name: NSNotification.Name(rawValue: "ErroAoEditarPerfil"), object: nil)
    }

    @objc private func apresentarSucesso() {
        self.viewLoadView.isHidden = true
        Singleton.shared.comercianteLogado?.nome = txtNome.text!
        Singleton.shared.comercianteLogado?.nomeFantasia = txtNomeFantasia.text!
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func apresentarErro() {
        self.viewLoadView.isHidden = true
        
        let alert = UIAlertController(title: "Erro ao alterar dado", message: "Confirme seus dados e tente novamente.", preferredStyle: .alert)
        alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "erro"), style: .cancel, handler: { _ in
            self.navigationController?.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAlterarPressed(_ sender: Any) {
        let perfil = PerfilData(emailAntigo: nil, emailNovo: nil, nome: txtNome.text, nomeFantasia: txtNomeFantasia.text, senhaAntiga: nil, novaSenha: nil)
        self.viewLoadView.isHidden = false
        
        repository.editarPerfil(perfil: perfil)
    }
}
