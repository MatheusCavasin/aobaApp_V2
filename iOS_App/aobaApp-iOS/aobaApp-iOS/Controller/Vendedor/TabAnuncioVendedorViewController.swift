//
//  TabAnuncioVendedorViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 14/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

// segmented control

import UIKit

class TabAnuncioVendedorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    
    @IBOutlet weak var CriarAnuncioButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblAnunciosAtivos: UILabel!
    @IBOutlet weak var lblSemAnuncio: UILabel!
    @IBOutlet weak var loadViewAnuncios: UIView!
    @IBOutlet weak var loadIndicatorAnuncios: UIActivityIndicatorView!
    
    
    
    let produtorRepositoy = ProdutorRepository()
    var downloadDados: Bool! // variável de controle para requisitar dados do back
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadDados = true
        CriarAnuncioButton.layer.cornerRadius = ButtonConfig.raioBorda
        CriarAnuncioButton.layer.borderWidth = ButtonConfig.larguraBorda
        CriarAnuncioButton.layer.borderColor = ButtonConfig.laranja
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadView), name: NSNotification.Name(rawValue: "NotificationID"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.dadosChamar), name: NSNotification.Name(rawValue: "NotificationID2"), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        dadosChamar()

    }
    
    @objc func dadosChamar(){
        
        if downloadDados{
            produtorRepositoy.getAnuncios()
            self.loadViewAnuncios.isHidden = false
            self.loadIndicatorAnuncios.startAnimating()
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "LoadView") as? LoadingViewController {
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: false, completion: nil)
//            }
//            self.downloadDados = false
        } /*else {
            self.downloadDados = true
            self.loadViewAnuncios.isHidden = true
            self.loadIndicatorAnuncios.stopAnimating()
            reloadView()
        }*/
        
        
    }
    
    @objc func dadosCapturados(){
        print("\n\nPegou?\n\n")
        
        
        
        
    }

    //    @objc func reloadView(){
    //        print("bbbbbbbbbbbb")
    //
    //        self.tableView.reloadData()
    //        if ModelVendedor.instance.hortifruit == [] {
    //            self.tableView.isHidden = true
    //            self.lblAnunciosAtivos.isHidden = true
    //            self.lblSemAnuncio.isHidden = false
    //        } else {
    //            self.tableView.isHidden = false
    //            self.lblAnunciosAtivos.isHidden = false
    //            self.lblSemAnuncio.isHidden = true
    //        }
    //
    //    }
    
    @objc func reloadView(){
        print("bbbbbbbbbbbb")
        
        self.loadViewAnuncios.isHidden = true
        self.loadIndicatorAnuncios.stopAnimating()
        
        self.tableView.reloadData()
        if ModelVendedor.instance.dictListaAnuncios.isEmpty {
            self.tableView.isHidden = true
            self.lblAnunciosAtivos.isHidden = true
            self.lblSemAnuncio.isHidden = false
        } else {
            self.tableView.isHidden = false
            self.lblAnunciosAtivos.isHidden = false
            self.lblSemAnuncio.isHidden = true
        }
        
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelVendedor.instance.dictListaAnuncios.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnuncioCell", for: indexPath) as! AnuncioVendedorTableViewCell
        /// let anuncio = Anuncios[indexPath.row]
        cell.configuracao(anuncio: ModelVendedor.instance.dictListaAnuncios[indexPath.row])
        
//        cell.imgProduto.image = UIImage(named: "maca_gala")
//        cell.imgProduto.layer.cornerRadius = 5
//        cell.lblTipo.text = "Maçã Gala"
//        cell.lblQuantidade.text = "5 caixas"
//        cell.lblValor.text = "R$ 100,00"
        
        ///cell.configure(for: anuncio)
        
        // Configure the cell...
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "EditarAnuncio") as? EditarAnuncioController {
            self.present(vc, animated:true, completion:nil)
        }
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            print("index path of delete: \(indexPath)")
            completionHandler(true)
        }
        
        let rename = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
            print("index path of edit: \(indexPath)")
            completionHandler(true)
        }
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [rename, delete])
        swipeActionConfig.performsFirstActionWithFullSwipe = false
        return swipeActionConfig
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
