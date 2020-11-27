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

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var CriarAnuncioButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblAnunciosAtivos: UILabel!
    @IBOutlet weak var lblSemAnuncio: UILabel!
    @IBOutlet weak var loadViewAnuncios: UIView!
    @IBOutlet weak var loadIndicatorAnuncios: UIActivityIndicatorView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    let produtorRepositoy = ProdutorRepository()
    var downloadDados: Bool! // variável de controle para requisitar dados do back
    var numLinhas = 0 // variável para contar o numero de linhas de acordo com anuncios ativos
    var listaAnuncios = [[String: Any]]() // para salvar os anuncios ativos ou inativos
    
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
        
        print("\n\n\n\n\n\n\n")
        print("DIDLOAD")
        print("\n\n\n\n\n\n\n")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("\n\n\n\n\n\n\n")
        print("WILL APPEAR")
        print("\n\n\n\n\n\n\n")
//        segmentedControl.selectedSegmentIndex = 1
        dadosChamar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        dadosChamar()
    }
    
    
    @IBAction func statusAnuncio(_ sender: UISegmentedControl) {
        
//        numLinhas = 0
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            dadosChamar()
            lblAnunciosAtivos.text = "Anuncios ativos"
        case 1:
            dadosChamar()
            lblAnunciosAtivos.text = "Anuncios inativos"
//            self.tableView.isHidden = true
        default:
            break;
        }
    }
    
    
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        tableView.setEditing(!tableView.isEditing, animated: true)
        if tableView.isEditing == true {
            editButton.title = "Ok"
        }else {
            editButton.title = "Editar"
        }
        
    }
    
    @objc func dadosChamar(){
        if downloadDados{
            guard ModelVendedor.instance.produtorLogado != nil else { return }
            self.produtorRepositoy.getAnuncios()
            self.loadViewAnuncios.isHidden = false
            self.loadIndicatorAnuncios.startAnimating()
        }
    }
    
    @objc func dadosCapturados(){
        print("\n\nPegou?\n\n")
        
        
        
        
    }
    
    @objc func reloadView(){
        
        var status: Bool!
        listaAnuncios.removeAll()
        
        if segmentedControl.selectedSegmentIndex == 0 {
            status = true
        } else {
            status = false
            
        }
        for i in ModelVendedor.instance.dictListaAnuncios {
            if (i["ativo"] as! Bool) == status {
                listaAnuncios.append(i)
            }
            print("\n\n\n\n\n\n\n")
            print(listaAnuncios.count)
            print("\n\n\n\n\n\n\n")
        }
        
        
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
        return listaAnuncios.count//numLinhas //ModelVendedor.instance.dictListaAnuncios.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnuncioCell", for: indexPath) as! AnuncioVendedorTableViewCell
        if segmentedControl.selectedSegmentIndex == 0 && (listaAnuncios[indexPath.row]["ativo"] as! Bool){
            /// let anuncio = Anuncios[indexPath.row]
            cell.configuracao(anuncio: listaAnuncios[indexPath.row], segmented: segmentedControl.selectedSegmentIndex)
        }
        else if segmentedControl.selectedSegmentIndex == 1 && !(listaAnuncios[indexPath.row]["ativo"] as! Bool) {
            cell.configuracao(anuncio: listaAnuncios[indexPath.row], segmented: segmentedControl.selectedSegmentIndex)
        }
        else {
            cell.isHidden = true
        }
        
        
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
            vc.nomeHortifruit = (listaAnuncios[indexPath.row]["produto"] as! [String : Any?])["nome"] as? String
            vc.idHortifruit = listaAnuncios[indexPath.row]["id"] as? Int
            ModelVendedor.instance.quantidadeCaixas = (listaAnuncios[indexPath.row]["qtdeMax"] as? Int)!
            ModelVendedor.instance.precoCaixa = (listaAnuncios[indexPath.row]["valor"] as? Double)!
//            vc.idHortifruit = ModelVendedor.instance.dictListaAnuncios[indexPath.row]["id"] as? Int
//            vc.qtdeHortifruit = ModelVendedor.instance.dictListaAnuncios[indexPath.row]["qtdeMax"] as? Int
//            vc.valorHortifruit = ModelVendedor.instance.dictListaAnuncios[indexPath.row]["valor"] as? Double
            self.present(vc, animated:true, completion: {
                self.segmentedControl.selectedSegmentIndex = 0
                self.dadosChamar()
            })
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            print("DELETAR \(indexPath.row)")
            let idAnuncio = listaAnuncios[indexPath.row]["id"] as! Int
            print("DELETAR \(idAnuncio)")
            produtorRepositoy.deletarAnuncio(idAnuncio: idAnuncio)
            dadosChamar()
            
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
