//
//  PedidoEmAndamentoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PedidoEmAndamentoTableViewCell: UITableViewCell {

    @IBOutlet weak var enteryView: UIView!
    @IBOutlet weak var headerVIew: UIView!
    @IBOutlet weak var mainText01: UILabel!
    @IBOutlet weak var mainText02: UILabel!
    @IBOutlet weak var mainText03: UILabel!
    @IBOutlet weak var dataText01: UILabel!
    @IBOutlet weak var dataText02: UILabel!
    @IBOutlet weak var dataText03: UILabel!
    @IBOutlet weak var circularIndicator01: UIView!
    @IBOutlet weak var circularIndicator02: UIView!
    @IBOutlet weak var circularIndicator03: UIView!
    @IBOutlet weak var telButton: UIButton!
    @IBOutlet weak var whatsButton: UIButton!
    @IBOutlet weak var confirmarButton: UIButton!
    var defaultColor: UIColor?
    
    
    static let identifier = "PedidoEmAndamentoTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PedidoEmAndamentoTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func config(defaultColor: UIColor) {
        self.defaultColor = defaultColor
        setupUI()
    }
    
    public func setStatus(status: StatusPedido) {
        switch status {
        case .realizado:
            self.fillDot(circularIndicator01, mainText01)
            self.emptyDot(circularIndicator02, mainText02)
            self.emptyDot(circularIndicator03, mainText03)
        case .confirmado:
            self.fillDot(circularIndicator01, mainText01)
            self.fillDot(circularIndicator02, mainText02)
            self.emptyDot(circularIndicator03, mainText03)
        case .entregue:
            self.fillDot(circularIndicator01, mainText01)
            self.fillDot(circularIndicator02, mainText02)
            self.fillDot(circularIndicator03, mainText03)
        default:
            self.emptyDot(circularIndicator01, mainText01)
            self.emptyDot(circularIndicator02, mainText02)
            self.emptyDot(circularIndicator03, mainText03)
        }
    }
    public func setMainTexts(firstField: String, secondField: String, thirdField: String) {
        self.mainText01.text = firstField
        self.mainText02.text = secondField
        self.mainText03.text = thirdField
    }
    public func setDataText(firstField: String, secondField: String, thirdField: String) {
        self.dataText01.text = firstField
        self.dataText02.text = secondField
        self.dataText03.text = thirdField
    }
    fileprivate func setupUI() {
        enteryView.layer.cornerRadius = 8
        enteryView.layer.borderWidth = 1.0
        enteryView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        setStatus(status: .pendente)
        setupButtons()
    }
    fileprivate func setupButtons() {
        telButton.layer.cornerRadius = 8
        telButton.layer.borderColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        telButton.layer.borderWidth = 2.0
        
        whatsButton.layer.cornerRadius = 8
        whatsButton.layer.borderColor = #colorLiteral(red: 0, green: 0.7470995188, blue: 0.2256398201, alpha: 1)
        whatsButton.layer.borderWidth = 2.0
        
        confirmarButton.layer.cornerRadius = 8
    }
    
    fileprivate func emptyDot(_ dot: UIView, _ label: UILabel) {
        dot.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        dot.layer.cornerRadius = dot.frame.width / 2
        dot.layer.borderWidth = 1.0
        dot.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    fileprivate func fillDot(_ dot: UIView, _ label: UILabel) {
        dot.backgroundColor = self.defaultColor
        dot.layer.cornerRadius = dot.frame.width / 2
        dot.layer.borderWidth = 0.0
        
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    @IBAction func telButtonPressed(_ sender: Any) {
    }
    @IBAction func whatButtonPressed(_ sender: Any) {
    }
    @IBAction func confirmarButtonPressed(_ sender: Any) {
        setStatus(status: .confirmado)
    }
}
