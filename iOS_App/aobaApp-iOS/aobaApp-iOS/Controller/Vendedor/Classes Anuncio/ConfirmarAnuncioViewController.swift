//
//  ConfirmarAnuncioViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 24/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit
import Firebase

class ConfirmarAnuncioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellsDelegate {
    
    @IBOutlet weak var tableViewAnuncio: UITableView!
    
    let produtorRepositoy = ProdutorRepository()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewAnuncio.register(FotoCollectionTableViewCell.nib(), forCellReuseIdentifier: FotoCollectionTableViewCell.identifier)
        tableViewAnuncio.delegate = self
        tableViewAnuncio.dataSource = self
        tableViewAnuncio.reloadData()
        tableViewAnuncio.separatorStyle = .none
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FotoCollectionTableViewCell.identifier, for: indexPath) as! FotoCollectionTableViewCell
            cell.configure(with: modelFotos, fotoInicial: false)
            return cell
        }
        else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NomeHortifruit", for: indexPath) as! LabelsCriarAnuncioTableViewCell
            cell.textLabel?.text = ModelVendedor.instance.tipoHortifruit
            return cell
        }
        else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PrecoCaixa", for: indexPath) as! LabelsCriarAnuncioTableViewCell
            var numberFormatter: NumberFormatter {
                let formatter = NumberFormatter()
                formatter.locale = Locale.current
                formatter.numberStyle = .currency
                
                return formatter
            }
            let valor = numberFormatter.string(from: NSNumber(value: ModelVendedor.instance.precoCaixa))
            cell.textLabel?.text = "\(valor as! String) caixa"
            return cell
        }
        
        else if indexPath.row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Entrega", for: indexPath) as! LabelsCriarAnuncioTableViewCell
            cell.textLabel?.text = "Entrega"
            return cell
        }
        
        else if indexPath.row == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProximoDia", for: indexPath) as! LabelsCriarAnuncioTableViewCell
            cell.textLabel?.text = "Próximo dia útil que o produtor estará na cidade"
            return cell
        }
        else if indexPath.row == 5 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DiaEntrega", for: indexPath) as! LabelsCriarAnuncioTableViewCell
            cell.textLabel?.text = "Segunda-Feira"
            return cell
        }
        else if indexPath.row == 6 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CaixasDisponiveis", for: indexPath) as! LabelsCriarAnuncioTableViewCell
            cell.textLabel?.text = "\(ModelVendedor.instance.quantidadeCaixas) caixas disponiveis"
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PublicarProdutoCell", for: indexPath) as! PublicarProdutoButtonCell
            cell.delegate = self
            return cell
        }
        
    }
    
    func addButtonPressed() {
        //        tableViewAnuncio.reloadData()
        print("ENTROU1")
        self.dismiss(animated: true)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationID"), object: nil)
    }
    func publicarButtonPressed() {
        print("ENTROU2")
        
        for imagem in modelFotos {
            
            let randomID = UUID.init().uuidString
            ModelVendedor.instance.idFoto.append(randomID)
            let uploadRef = Storage.storage().reference(withPath: "\(randomID).jpg")
            guard let imagem = imagem.imageName?.jpegData(compressionQuality: 0.75) else { return }
            let uploadMetadata = StorageMetadata.init()
            uploadMetadata.contentType = "image/jpeg"
            
            uploadRef.putData(imagem, metadata: uploadMetadata) { (dowloadMetadata, error) in
                if let error = error {
                    print("erro no upload da imagem! \(error.localizedDescription)")
                    return
                }
                print("Imagem enviada corretamente: \(dowloadMetadata)")
            }
        }
        
        produtorRepositoy.criarAnuncio()

        
        
        
        
        self.dismiss(animated: true){
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NotificationID"), object: nil)
            ModelVendedor.instance.idFoto.removeAll()
            
        }
    }
    
    
}
