//
//  LoadingViewController.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 18/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController {
    private lazy var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        self.view.backgroundColor = UIColor.yellow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.black
        self.activityIndicator.startAnimating()
    }
}
