//
//  CriarAnuncioViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 19/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class CriarAnuncioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, CellsDelegate {
    
    
    
    
    @IBOutlet weak var tableViewAnuncio: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewSearch: UITableView!
    
    var qtde = 0
    var tabVendedor = TabAnuncioVendedorViewController()
    var filtroHortifruit = ModelVendedor.instance.dictListaProdutos
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAnuncio.delegate = self
        tableViewAnuncio.dataSource = self
        tableViewAnuncio.reloadData()
        tableViewAnuncio.separatorStyle = .none
        
        tableViewSearch.delegate = self
        tableViewSearch.dataSource = self
        
        searchBar.delegate = self
        
       

    }
    
    
    @IBAction func CancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
                
                filtroHortifruit = ModelVendedor.instance.dictListaProdutos
            }
            else {
                
                filtroHortifruit = ModelVendedor.instance.dictListaProdutos.filter { fruta in
                    return (fruta["nome"] as! String).lowercased().contains(searchText.lowercased())
                }
            }
            
            tableViewSearch.reloadData()
        }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    
        tableViewSearch.isHidden = false
    }
    
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numberRow = 1
        
        switch tableView {
        case tableViewAnuncio:
            numberRow = 7
        case tableViewSearch:
            numberRow = filtroHortifruit.count
        default:
            print("Algo deu errado!")
        }
        return numberRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellReturn = UITableViewCell()
        switch tableView {
        case tableViewAnuncio:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "naoEncontreiCell", for: indexPath) as! NaoEcontreiButtonCell
                //set the data here
                cellReturn = cell
            }
            else if indexPath.row == 1 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "lblQtdeCaixasCell", for: indexPath) as! LabelsCriarAnuncioTableViewCell
                cellReturn = cell
            }
            else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "qtdeCaixasCell", for: indexPath) as! QtdeCaixasCell
                
                cellReturn = cell
            }
            else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "lblValorCell", for: indexPath) as! LabelsCriarAnuncioTableViewCell
                cellReturn = cell
            }
            else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "txtValorCell", for: indexPath) as! TextFieldValorCell
                cellReturn = cell
            }
            else if indexPath.row == 5 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "fotoCell", for: indexPath) as! FotoButtonCell
                cellReturn = cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "addProdutoCell", for: indexPath) as! AddProdutoButtonCell
                cell.delegate = self
                cellReturn = cell
            }
        case tableViewSearch:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellSearch", for: indexPath)
            
            cell.textLabel?.text = filtroHortifruit[indexPath.row]["nome"] as! String
//                   cell.detailTextLabel?.text = filtroHortifruit[indexPath.row].tipo
                   cellReturn = cell
        default:
            print("Algo deu errado!")
        }
        return cellReturn
        
        
        
        /*
        else if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lblProdutosCell", for: indexPath) as! LabelsCriarAnuncioTableViewCell
            return cell
        } else if indexPath.row == 11 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "publicarCell", for: indexPath) as! PublicarButtonCell
            cell.delegate = self
            return cell
        }
        else  { // para adicionar varias linhas na table view na posicao dos produtos
            let cell = tableView.dequeueReusableCell(withIdentifier: "produtosCell", for: indexPath) as! ProdutosTableViewCell
            /*cell.imgProduto.image = UIImage(named: "maca_gala")
             cell.imgProduto.layer.cornerRadius = 5
             cell.lblTipo.text = "Maçã Gala"
             cell.lblQuantidade.text = "5 caixas"
             cell.lblValor.text = "R$ 100,00" */
            return cell
            
            
        } */
        
        
        //        else{
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "publicarCell", for: indexPath) as! PublicarButtonCell
        //            return cell
        //        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableViewSearch {
            searchBar.text = filtroHortifruit[indexPath.row]["nome"] as! String
            tableView.isHidden = true
            dismissKeyboard()
        }
    }
    
    func addButtonPressed() {
        tableViewAnuncio.reloadData()
        self.dismiss(animated: true)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationID"), object: nil)
    }
    func publicarButtonPressed() {
        self.dismiss(animated: true){
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NotificationID"), object: nil)

        }
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
