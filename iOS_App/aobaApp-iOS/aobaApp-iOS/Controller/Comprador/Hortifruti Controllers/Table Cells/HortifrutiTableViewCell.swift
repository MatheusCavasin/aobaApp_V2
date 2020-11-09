//
//  HortifrurisTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 14/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit
import Foundation

class HortifrutiTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    static let identifier = "HortifrutiTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HortifrutiTableViewCell",
                     bundle: nil)
    }
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var title: UILabel!
    var navigationController: UINavigationController!
    
    public var diaDaSemana: String?
    public var produtos: [AtivosCategoria]!
    private let classificadorDeSecoes = ClassificadorDeSecoes()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(HortifrutiCollectionViewCell.nib(), forCellWithReuseIdentifier: HortifrutiCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
    }
    
    func configure(title: String, produtos: [AtivosCategoria]) {
        self.title.text = title
        self.produtos = produtos
    }
    
    // Collection view inside table row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.produtos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HortifrutiCollectionViewCell.identifier, for: indexPath) as! HortifrutiCollectionViewCell
        cell.configure(name: produtos[indexPath.row].categoria, imageName: produtos[indexPath.row].foto)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 143)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let produtosViewController: ProdutoTableViewController!
        let produtosView = UIStoryboard(name: "TabHortifrutiComprador", bundle: nil)
        
        
        produtosViewController = produtosView.instantiateViewController(identifier: "produtos") as? ProdutoTableViewController
        
        // Melhora a navegação 
        collectionView.cellForItem(at: indexPath)?.isSelected = false
        
        
        self.navigationController.show(produtosViewController, sender: self)
        print(produtos[indexPath.row].categoria)
        produtosViewController.navigationItem.title = produtos[indexPath.row].categoria
        
        if diaDaSemana != nil {
            produtosViewController.produtos = classificadorDeSecoes.getProdutosDaCategoria(categoria: self.produtos[indexPath.row], diaDaSemana: diaDaSemana!)
            produtosViewController.diaDaSemana = diaDaSemana!
            
        } else {
            produtosViewController.produtos = classificadorDeSecoes.getProdutosDaCategoria(categoria: self.produtos[indexPath.row], diaDaSemana: title.text!)
            produtosViewController.diaDaSemana = title.text!
        }
    }
}
