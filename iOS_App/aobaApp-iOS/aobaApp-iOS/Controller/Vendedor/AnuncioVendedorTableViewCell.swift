//
//  AnuncioVendedorTableViewCell.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 14/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit
import Firebase


class AnuncioVendedorTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgProduto: UIImageView!
    @IBOutlet weak var lblTipo: UILabel!
    @IBOutlet weak var lblQuantidade: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    @IBOutlet weak var switchStatus: UISwitch!
    
    let produtorRepositoy = ProdutorRepository()
    var idAnuncio = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    /*

    import Firebase

     colocar dentro de um for
     
    let storageRef = Storage.storage().reference(withPath: "Aqui vai o id da foto que voce vai pegar do array de fotos do back")
    storageRef.getData(maxSize: 4 * 1024 * 1024) { (data, error) in
        if let error == error {
            print("Erro no download: \(error.localizedDescription)")
            return
        }
        if data == data {
            variavel da imagemView que voce quer coloca-la = UIImage(data: data)
        }
        
    }
     
     end funcao for
    */

    

    func configuracao(anuncio: [String: Any]){
        
        let produto = (anuncio["produto"] as! [String : Any?])["nome"] as? String
        let caixas = anuncio["qtdeMax"] as! Int
        let valor = anuncio["valor"] as! Double
        let ativo = anuncio["ativo"] as! Bool
        
        
        let storageRef = Storage.storage().reference(withPath: "\((anuncio["fotos"] as! [String])[0]).jpg")
        storageRef.getData(maxSize: 4 * 1024 * 1024) { [weak self](data, error) in
            if let error = error {
                print("Erro no download: \(error.localizedDescription)")
                return
            }
            if let data = data {
                self?.imgProduto.image = UIImage(data: data)
            }
        }
        
        
        var formato = NumberFormatter()
        formato.usesGroupingSeparator = true
        formato.numberStyle = .currency
        formato.locale = Locale.current
        let valorString = formato.string(from: NSNumber(value: valor))!
        
//        self.imgProduto.image = UIImage(named: "fruta-laranja")
        self.lblTipo.text = produto
        self.lblQuantidade.text = ("\(caixas) caixas disponíveis")
        self.lblValor.text = "\(valorString)"
        self.switchStatus.isOn = ativo
        self.idAnuncio = anuncio["id"] as! Int
    }
    
    @IBAction func switchChange(_ sender: Any) {
        print(switchStatus.isOn)
        if switchStatus.isOn {
            produtorRepositoy.ativarAnuncio(idAnuncio: idAnuncio)
        } else {
            produtorRepositoy.desativarAnuncio(idAnuncio: idAnuncio)
        }
        
        
    }
    
 
    
}
