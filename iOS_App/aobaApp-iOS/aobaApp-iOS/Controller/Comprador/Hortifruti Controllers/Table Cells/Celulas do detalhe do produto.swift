//
//  HeaderTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 20/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imgProduto: UIImageView!
    
    override func awakeFromNib() {
        imgProduto.layer.cornerRadius = 5.0
    }
    
    public func congif(imageName: String) {
        self.imgProduto.image = UIImage(named: imageName)
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
    @IBOutlet weak var btnAdicionar: UIButton!
    
    private var quantidade: Int = 0
    private var pickerData: [String] = []
    private var produto: Dictionary<String, Any> = [:]
    public var presentView: DetalhesDoProdutoViewController!
    
    override func awakeFromNib() {
        
    }
    
    public func config(produto: Dictionary<String, Any>) {
       quantidade = produto["quantidadeDisponiel"] as! Int
        for i in 0...quantidade {
            pickerData.append("\(i)")
        }
        self.pkvQuantidade.delegate = self
        self.pkvQuantidade.dataSource = self
        self.produto = produto
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
    
    @IBAction func btnAdicionarPressed(_ sender: Any) {
        presentView.dismiss(animated: true, completion: nil)
        let quantidadeEscolhida = pkvQuantidade.selectedRow(inComponent: 0)
        
        var produtos = Singleton.shared.carrinho["produtos"] as! [Dictionary<String, Any>]
        let novoProduto: Dictionary<String, Any> = [
            "titulo": produto["titulo"] ?? "nome da fruta",
            "imagem": produto["imagem"] ?? "logo",
            "preco": produto["preco"] ?? 0.00,
            "quantidade": quantidadeEscolhida,
        ]
        
        produtos.append(novoProduto)
        Singleton.shared.carrinho["produtos"] = produtos
    }
    
    private func adicionarProduto() {
        
    }
}

