//
//  FotoCollectionTableViewCell.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 23/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class FotoCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    

    @IBOutlet var collectionView: UICollectionView!
    
    var fotos = [FotosHortifruit]()
    var fotoInicial: Bool!
    
    static let identifier = "FotoCollectionTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FotoCollectionTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(FotoCollectionViewCell.nib(), forCellWithReuseIdentifier: FotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure (with fotos: [FotosHortifruit], fotoInicial: Bool){
        self.fotos = fotos
        self.fotoInicial = fotoInicial
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if fotoInicial {
            return fotos.count + 1 // quando precisa da imagem "Adicionar foto"
        } else {
            return fotos.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FotoCollectionViewCell.identifier, for: indexPath) as! FotoCollectionViewCell
        if indexPath.row == 0 && fotoInicial {
            cell.configureFirst()
        } else {
            if fotoInicial {
                cell.configure(with: fotos[indexPath.row - 1]) // -1 para quando há a foto "Adicionar foto" que nao esta no array modelFotos
            } else {
                cell.configure(with: fotos[indexPath.row]) // para quando não há a foto "Adicionar foto" e o array de fotos é igual ao numero de colunas
            }
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 110)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 40
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 && fotoInicial{
            print("FOOOOOOI")
            NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationFoto"), object: nil)
//            present(vc, animated: true)
//
        }
    }

    
    
}
