//
//  PrincipalComprador.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 12/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PrincipalComprador: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    func setUp() {
        
        let storyboard1 = UIStoryboard(name: "TabPedidosComprador", bundle: nil)
        let storyboard = UIStoryboard(name: "TabHortifrutiComprador", bundle: nil)
        
        let firstBookTableVc = storyboard.instantiateViewController(withIdentifier: "TabHortifrutiComprador")
        let secondBookTableVc = storyboard1.instantiateViewController(withIdentifier: "TabPedidosComprador")
        
        //configure the view controllers here...
        
        viewControllers = [firstBookTableVc, secondBookTableVc]
        
        //        tabBar.items?[0].image = [first tab bar image]
        //        tabBar.items?[1].image = [second tab bar image]
        
        tabBar.items?[0].title = "Hortfruits"
        tabBar.items?[1].title = "Pedidos"
    }
}
