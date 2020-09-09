//
//  AnuncioVendedorTableViewCell.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 14/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class AnuncioVendedorTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgProduto: UIImageView!
    @IBOutlet weak var lblTipo: UILabel!
    @IBOutlet weak var lblQuantidade: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /*func configuracao(for anuncios: Anuncio){
        
        self.imgProduto.image = UIImage(named: "maca_gala")
        self.lblTipo.text = "Maçã Gala"
        self.lblQuantidade.text = "5 caixas"
        self.lblValor.text = "R$ 100,00"
        
    }
 */
    
}
