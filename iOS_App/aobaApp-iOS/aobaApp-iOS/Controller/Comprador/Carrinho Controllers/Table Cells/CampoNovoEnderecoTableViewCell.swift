//
//  CampoNovoEnderecoTableViewCell.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 23/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class CampoNovoEnderecoTableViewCell: UITableViewCell, UITextFieldDelegate {

    
    @IBOutlet weak var txtCampo: UITextField!
    public var campo: String?
    
    static let identifier = "CampoNovoEnderecoTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "CampoNovoEnderecoTableViewCell", bundle: nil)
    }
    
    public func config(_ placeholder: String, controller: EnderecoCompradorViewController) {
        txtCampo.placeholder = placeholder
    }
    
    @IBAction func txtCampoChanged(_ sender: UITextField) {
        campo = sender.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
