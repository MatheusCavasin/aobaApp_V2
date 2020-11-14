//
//  EditarAnuncioController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 02/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class EditarAnuncioController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewEditar: UITableView!
    
    var nomeHortifruit: String!
    var idHortifruit: Int!
    var qtdeHortifruit: Int!
    var valorHortifruit: Double!
    var teste = TabAnuncioVendedorViewController()
    
    let produtorRepositoy = ProdutorRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewEditar.delegate = self
        tableViewEditar.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func salvarButton(_ sender: Any) {
        produtorRepositoy.editarAnuncio(idAnuncio: idHortifruit, qtde: ModelVendedor.instance.quantidadeCaixas, valor: ModelVendedor.instance.precoCaixa)
        self.dismiss(animated: true, completion: {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationID2"), object: nil)
        })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lblProdutoCell", for: indexPath) as! EditarAnuncioTableViewCell
            cell.lblProduto.text = nomeHortifruit
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lblQtdeCaixasCell", for: indexPath) as! EditarAnuncioTableViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "qtdeCaixasCell", for: indexPath) as! QtdeCaixasCell
//            cell.lblCaixas.text = String(qtdeHortifruit)
            return cell
        } else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "lblValorCell", for: indexPath) as! EditarAnuncioTableViewCell
            return cell
        } else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "txtValorCell", for: indexPath) as! TextFieldValorCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "salvarEdicao", for: indexPath) as! editarButtonCell
            return cell
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
