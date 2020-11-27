//
//  Cadastro3VendedorViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 16/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class Cadastro3VendedorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var diasTableView: UITableView!
    fileprivate var celulasSelecionadas = [DiaSemana]()
    fileprivate let repository = ProdutorRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diasTableView.delegate = self
        diasTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diasCell") as! DiasTableViewCell
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Segunda-feira"
        case 1:
            cell.textLabel?.text = "Terça-feira"
        case 2:
            cell.textLabel?.text = "Quarta-feira"
        case 3:
            cell.textLabel?.text = "Quinta-feira"
        default:
            cell.textLabel?.text = "Sexta-feira"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.textLabel?.textColor = UIColor(cgColor: ButtonConfig.laranja)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        switch indexPath.row {
        case 0:
            celulasSelecionadas.append(.SEG)
        case 1:
            celulasSelecionadas.append(.TER)
        case 2:
            celulasSelecionadas.append(.QUA)
        case 3:
            celulasSelecionadas.append(.QUI)
        case 4:
            celulasSelecionadas.append(.SEX)
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.textLabel?.textColor = UIColor(cgColor: CGColor.init(gray: 0, alpha: 1))
        switch indexPath.row {
        case 0:
            celulasSelecionadas.removeAll(where: {$0 == .SEG})
        case 1:
            celulasSelecionadas.removeAll(where: {$0 == .TER})
        case 2:
            celulasSelecionadas.removeAll(where: {$0 == .QUA})
        case 3:
            celulasSelecionadas.removeAll(where: {$0 == .QUI})
        case 4:
            celulasSelecionadas.removeAll(where: {$0 == .SEX})
        default:
            return
        }
    }
    
    @IBAction func cadastrarButtonPressed(_ sender: Any) {
        let produtorCreated: Produtor =
            Produtor(
                email: ModelVendedor.instance.email,
                senha: ModelVendedor.instance.senha,
                nome: ModelVendedor.instance.nome,
                telefone: ModelVendedor.instance.telefone,
                codigo_registro: ModelVendedor.instance.codigo_registro,
                nomeFantasia: ModelVendedor.instance.nomeFantasia,
                foto: "",
                descricao: ModelVendedor.instance.descricao,
                diasAtendimento: celulasSelecionadas
            )
        repository.create(produtor: produtorCreated) { (result, err) in
            if result != nil {
                
                let produtorDict = result as! Dictionary<String, Any>
                let produtor = Produtor.dictionaryToObject(dictionary: produtorDict)
                ModelVendedor.instance.produtorLogado = produtor
                
                let defaults = UserDefaults.standard
                defaults.set(produtor.email, forKey: "Usuario")
                defaults.set(produtorCreated.senha, forKey: "senha")
                self.repository.getProdutos()
            } else {
                let alert = UIAlertController(title: "Parece que algo de errado", message: "Confira seus dados e tente novamente", preferredStyle: .alert)
                alert.view.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

