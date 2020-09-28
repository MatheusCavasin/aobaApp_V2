//
//  FotoCollectionViewCell.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 23/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var imageHortifruit: UIImageView!
    
    static let identifier = "FotoCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FotoCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with foto: FotosHortifruit){
        self.imageHortifruit.image = foto.imageName
        self.imageHortifruit.contentMode = .scaleAspectFit
    }
    
    public func configureFirst(){
        self.imageHortifruit.image = UIImage(named: "AdicionarFoto")
    }
    
    
    
}
