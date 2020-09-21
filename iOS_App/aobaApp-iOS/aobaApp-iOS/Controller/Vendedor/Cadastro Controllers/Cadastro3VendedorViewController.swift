//
//  Cadastro3VendedorViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 16/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class Cadastro3VendedorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var diasTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diasTableView.delegate = self
        diasTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diasCell") as! DiasTableViewCell
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Segunda-feira"
        case 1:
            cell.textLabel?.text = "Terça-feira"
        case 2:
            cell.textLabel?.text = "Quarta-feira"
        case 3:
            cell.textLabel?.text = "Quinta-feira"
        default:
            cell.textLabel?.text = "Sexta-feira"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        cell.textLabel?.textColor = UIColor(cgColor: ButtonConfig.laranja)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
