//
//  HeaderTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 20/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit
import Firebase

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imgProduto: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        imgProduto.layer.cornerRadius = 5.0
    }
    
    public func congif(imageName: String) {
        let storageRef = Storage.storage().reference(withPath: imageName + ".jpg")
        storageRef.getData(maxSize: 4 * 1024 * 1024) { data, error in
            if let _ = error {
                self.imgProduto.image = UIImage(named: "default-image")
                self.loadingIndicator.isHidden = true
                return
            } else {
                self.imgProduto.image = UIImage(data: data!)
            }
        }
    }
    
}

class TitleTableViewCell: UITableViewCell {
    @IBOutlet weak var nomeDoProduto: UILabel!
    @IBOutlet weak var precoDoProduto: UILabel!
    
    
    override func awakeFromNib() {
    }
    
    public func config(nome: String, preco: Float) {
        self.nomeDoProduto.text = nome
        self.precoDoProduto.text = String(format: "%.2f", preco).replacingOccurrences(of: ".", with: ",")
    }
}

class FazendaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viwBackground: UIView!
    @IBOutlet weak var lblFazenda: UILabel!
    @IBOutlet weak var lblAvaliacao: UILabel!
    
    override func awakeFromNib() {
        viwBackground.layer.cornerRadius = 10.0
        viwBackground.layer.borderWidth = 0.5
        viwBackground.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    public func config(nomeFazenda: String, avaliacao: Float) {
        self.lblFazenda.text = nomeFazenda
        self.lblAvaliacao.text = String(format: "%.1f", avaliacao)
    }
}


class CaixasDisponivelsTableViewCell: UITableViewCell {
        
    @IBOutlet weak var lblQuantidade: UILabel!
    override func awakeFromNib() {
    }
    
    public func config(quantidadeDisponivel: Int) {
        self.lblQuantidade.text = "\(String(quantidadeDisponivel)) caixas disponíveis"
    }
}

class QuantidadeTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pkvQuantidade: UIPickerView!
    
    private var quantidade: Int = 0
    private var pickerData: [String] = []
    private var anuncio: AtivosAnuncio!
    private var controller: DetalhesDoProdutoViewController!
    public var presentView: DetalhesDoProdutoViewController!
    public var quantidadeEscolhida: Int?
    
    
    override func awakeFromNib() {
        
    }
    
    public func config(anuncio: AtivosAnuncio, controller: DetalhesDoProdutoViewController) {
        
        self.controller = controller
        
        quantidade = anuncio.qtdeMax
        for i in 0...quantidade {
            pickerData.append("\(i)")
        }
        self.pkvQuantidade.delegate = self
        self.pkvQuantidade.dataSource = self
        self.anuncio = anuncio
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //Igual ao numero de caixas disponiveis
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.quantidadeEscolhida = Int(pickerData[row])
        self.controller.quantidade = quantidadeEscolhida
    }
}

class BotaoAdicionar: UITableViewCell {
    
    @IBOutlet weak var btnAdicionar: UIButton!
    override func awakeFromNib() {
        btnAdicionar.layer.cornerRadius = 5.0
    }
}
