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
    
    func configure (with fotos: [FotosHortifruit]){
        self.fotos = fotos
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FotoCollectionViewCell.identifier, for: indexPath) as! FotoCollectionViewCell
        if indexPath.row == 0 {
            cell.configureFirst()
        } else {
            cell.configure(with: fotos[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 124)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("FOOOOOOI")
            NotificationCenter.default.post(name: Notification.Name(rawValue: "NotificationID"), object: nil)
//            present(vc, animated: true)
//
        }
    }

    
    
}
