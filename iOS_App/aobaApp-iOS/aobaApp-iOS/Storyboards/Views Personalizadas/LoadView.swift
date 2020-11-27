//
//  LoadView.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 25/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class LoadView: UIView {

    static var shared = LoadView()
    fileprivate var backView: UIView?
    fileprivate var loadIndicator: UIActivityIndicatorView?
    
    func showLoadView(_ currentView: UIView) {
        DispatchQueue.main.async { [self] in
            /* Configuração da view back view*/
            backView = {
                let view = UIView()
                view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2802321743)
                return view
            }()
            currentView.addSubview(self.backView!)
            
            backView?.translatesAutoresizingMaskIntoConstraints = false
            backView?.topAnchor.constraint(equalTo: currentView.topAnchor).isActive = true
            backView?.trailingAnchor.constraint(equalTo: currentView.trailingAnchor).isActive = true
            backView?.leadingAnchor.constraint(equalTo: currentView.leadingAnchor).isActive = true
            backView?.bottomAnchor.constraint(equalTo: currentView.bottomAnchor).isActive = true
            /* Fim da configuração da view back view*/
            
            
            /* Configuração do load indicator */
            loadIndicator = {
                let load = UIActivityIndicatorView()
                load.style = .large
                load.startAnimating()
                load.color = .white
                return load
            }()
            
            backView?.addSubview(loadIndicator!)
            loadIndicator?.translatesAutoresizingMaskIntoConstraints = false
            loadIndicator?.centerYAnchor.constraint(equalTo: backView!.centerYAnchor).isActive = true
            loadIndicator?.centerXAnchor.constraint(equalTo: backView!.centerXAnchor).isActive = true
            /* Dim da configuração do load indicator */
            
            self.backView!.isHidden = false
            
        }
    }
    
    func hideLoadView() {
        guard let backView = self.backView else { return }
        DispatchQueue.main.async {
            backView.isHidden = true
        }
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
