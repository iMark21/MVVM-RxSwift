//
//  CryptoListCoordinator.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 07/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit

protocol CryptoListCoordinatorDelegate: class{
    func listCoordinatorDidFinish()
}

class CryptoListCoordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController
    weak var delegate: CryptoListCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showCryptoList()
    }
    
    func showCryptoList() {
        let storyboard = UIStoryboard(name: LayoutIdentifiers.Main, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CryptoListViewController") as? CryptoListViewController
        if let viewcontroller = vc {
            let repository = CMCRepository()
            let viewModel =  CryptoListViewModel(repository: repository)
            viewcontroller.viewModel = viewModel
            navigationController.pushViewController(viewcontroller, animated: true)
        }
    }
    
    func showDetail() {
        
    }
}

extension CryptoListCoordinator: CryptoListCoordinatorDelegate {
    func listCoordinatorDidFinish() {
        
    }
}

