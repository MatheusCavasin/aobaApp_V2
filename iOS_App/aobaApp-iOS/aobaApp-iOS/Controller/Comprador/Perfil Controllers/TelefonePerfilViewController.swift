//
//  TelefonePerfilViewController.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/10/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class TelefonePerfilViewController: UIViewController {

    @IBOutlet weak var txtTelefoneAtual: UITextField!
    @IBOutlet weak var txtNovoTelefone: UITextField!
    @IBOutlet weak var btnCancelar: UIButton!
    @IBOutlet weak var btnAlterar: UIButton!
    @IBOutlet weak var viewLoadView: UIView!
    let repository = CompradorRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLoadView.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.apresentarSucesso), name: NSNotification.Name(rawValue: "PerfilEditado"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.apresentarErro), name: NSNotification.Name(rawValue: "ErroAoEditarPerfil"), object: nil)
    }
    
    @objc private func apresentarSucesso() {
        self.viewLoadView.isHidden = true
        Singleton.shared.comercianteLogado?.telefone = txtNovoTelefone.text!
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func apresentarErro() {
        self.viewLoadView.isHidden = true
        let alert = UIAlertController(title: "Erro ao alterar dado", message: "Confirme seus dados e tente novamente.", preferredStyle: .alert)
        alert.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "ok"), style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnCancelarPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnAlterarPressed(_ sender: Any) {
        let perfil = PerfilData(emailAntigo: nil, emailNovo: nil, nome: nil, nomeFantasia: nil, senhaAntiga: nil, novaSenha: nil, telefoneAntigo: self.txtTelefoneAtual.text, telefoneNovo: self.txtNovoTelefone.text)
        self.viewLoadView.isHidden = false

        repository.editarPerfil(perfil: perfil)
    }
}
