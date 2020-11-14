//
//  PrincipalVendedor.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 12/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation
import UIKit

class PrincipalVendedor: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setUp()
    }

    func setUp() {

        let storyboard = UIStoryboard(name: "TabAnuncioVendedor", bundle: nil)
        let storyboard1 = UIStoryboard(name: "TabPedidosVendedor", bundle: nil)
        let storyboard2 = UIStoryboard(name: "TabPerfilVendedor", bundle: nil)

        let firstBookTableVc = storyboard.instantiateViewController(withIdentifier: "TabAnuncioVendedor")
        let secondBookTableVc = storyboard1.instantiateViewController(withIdentifier: "TabPedidosVendedor")
        let thirdBookTableVc = storyboard2.instantiateViewController(withIdentifier: "TabPerfilVendedor")

        //configure the view controllers here...

        viewControllers = [firstBookTableVc, secondBookTableVc, thirdBookTableVc]

//        tabBar.items?[0].image = [first tab bar image]
//        tabBar.items?[1].image = [second tab bar image]

        tabBar.items?[0].title = "Anuncios"
        tabBar.items?[1].title = "Pedidos"
        tabBar.items?[2].title = "Perfil"
    }
    
    
}
