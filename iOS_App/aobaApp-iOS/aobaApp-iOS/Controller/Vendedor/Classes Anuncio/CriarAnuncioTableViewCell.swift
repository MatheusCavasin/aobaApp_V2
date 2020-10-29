//
//  CriarAnuncioTableViewCell.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 20/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit


class LabelsCriarAnuncioTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var lblQtdeCaixasCell: UILabel!
    @IBOutlet weak var lblValorCell: UILabel!
    @IBOutlet weak var lbDataCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func validade(){
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.day = 7
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        
        let dateFormat2 = DateFormatter()
        dateFormat2.dateFormat = "MMMM"
        dateFormat2.locale = Locale(identifier: "pt_BR")
        let stringMonth = dateFormat2.string(from: futureDate!)

        let dateFormat3 = DateFormatter()
        dateFormat3.dateFormat = "dd"
        let numDay = dateFormat3.string(from: futureDate!)
        
        lbDataCell.text = String(format: "%@ %@", numDay, stringMonth)
    }
    
}

class NaoEcontreiButtonCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

class QtdeCaixasCell: UITableViewCell {
    
    
    @IBOutlet weak var lblCaixas: UILabel!
    @IBOutlet weak var stepperButton: UIStepper!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func stepperCaixas(_ sender: UIStepper) {
        
        var number = 0
        number = Int(sender.value)
        ModelVendedor.instance.quantidadeCaixas = number
        lblCaixas.text = String(number)
    }
    
    
    
}

class TextFieldValorCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var txtPreco: UITextField!
    
    var qtde = 0
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        return formatter
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtPreco.delegate = self
        txtPreco.placeholder = updateTextField()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTextField () -> String? {
        let numero = Double(qtde/100) + Double(qtde%100)/100
        ModelVendedor.instance.precoCaixa = numero
        return numberFormatter.string(from: NSNumber(value: numero))
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let digit = Int(string) {
            self.qtde = qtde * 10 + digit
            
            if qtde > 1_000_000 {
                let alerta = UIAlertController(title: "O valor deve ser menor que 100 mil reais", message: nil, preferredStyle: .alert)
                alerta.view.tintColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
                alerta.addAction(UIAlertAction(title: "Fechar", style: .default, handler: { (action) in
                    
                    self.qtde = 0
                    self.txtPreco.text = ""
                }))
                //                present(alerta, animated: true, completion: nil)
            } else {
                txtPreco.text = updateTextField()
            }
        }
        
        if string == "" {
            qtde = qtde/10
            txtPreco.text = updateTextField()
        }
        
        return false
    }
    
}

class FotoButtonCell: UITableViewCell {
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        addFotoButton.layer.cornerRadius = ButtonConfig.raioBorda
//        addFotoButton.layer.borderWidth = ButtonConfig.larguraBorda
//        addFotoButton.layer.borderColor = ButtonConfig.laranja
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func button(_ sender: Any) {
        print("AAAAAA\n\n AAAAAA")
    }
    
    
}

class PublicarProdutoButtonCell: UITableViewCell {
    
    @IBOutlet weak var publicarProdutoButton: UIButton!
    weak var delegate: CellsDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        publicarProdutoButton.layer.cornerRadius = ButtonConfig.raioBorda
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func publicarProdutoButton(_ sender: Any) {
        delegate?.publicarButtonPressed()
        print("Add produto pressionado")
//        ModelVendedor.instance.hortifruit = ["maça gala", "5", "R$ 70,00"]
    }
    
    
}

class AddProdutoButtonCell: UITableViewCell {
    

    @IBOutlet weak var addProdutoButton: UIButton!

//    weak var delegate: CellsDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addProdutoButton.layer.cornerRadius = ButtonConfig.raioBorda
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}



class ProdutosTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgProduto: UIImageView!
    @IBOutlet weak var lblTipo: UILabel!
    @IBOutlet weak var lblQuantidade: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    
    
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if ModelVendedor.instance.hortifruit == [] {
            self.isHidden = true
            
        } else {
            self.isHidden = false
            configureCell(horfruit: ModelVendedor.instance.hortifruit)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

    
    func configureCell (horfruit: [String]) {
        
        self.imgProduto.image = UIImage(named: "maca_gala")
        self.lblTipo.text = horfruit[0]
        self.lblQuantidade.text = horfruit[1] + " caixas"
        self.lblValor.text = horfruit[2]
    }
    
}

class PublicarButtonCell: UITableViewCell {
    
    weak var delegate: CellsDelegate?
    @IBOutlet weak var publicarButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        publicarButton.layer.cornerRadius = ButtonConfig.raioBorda
        if ModelVendedor.instance.hortifruit == [] {
            self.isHidden = true
            
        } else {
            self.isHidden = false
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func publicarButton(_ sender: Any) {
        print("publicar!")
        delegate?.publicarButtonPressed()
    }
}


// MARK: Classes de Edição do Anuncio
/// obs: algumas estao sendo reaproveitadas com as classes de criação do anuncio

class EditarAnuncioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblProduto: UILabel!
    @IBOutlet weak var lblQtdeCaixas: UILabel!
    @IBOutlet weak var lblPrecoCaixa: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

class editarButtonCell: UITableViewCell {
    
    
    @IBOutlet weak var editarButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        editarButton.layer.cornerRadius = ButtonConfig.raioBorda
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}



protocol CellsDelegate: class {
    func addButtonPressed()
    func publicarButtonPressed()
}
