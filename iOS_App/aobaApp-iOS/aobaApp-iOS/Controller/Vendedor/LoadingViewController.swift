//
//  LoadingViewController.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 08/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.sumir), name: NSNotification.Name(rawValue: "NotificationID3"), object: nil)

        // Do any additional setup after loading the view.
    }
    
    
    @objc func sumir(){
        self.popoverPresentationController
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
