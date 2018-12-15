//
//  AppCoordinator.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 07/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit

// MARK: - Coordinator keys

enum AppChildCoordinator {
    case cryptolist
    case detail
}

class AppCoordinator: CoordinatorProtocol {
    
    private let window: UIWindow
    private var childCoordinators = [AppChildCoordinator: CoordinatorProtocol]()
    private let navigationController: UINavigationController
    
    init(window: UIWindow){
        self.window = window
        navigationController = UINavigationController()
        self.window.rootViewController = navigationController
    }
    
    func start(){
        showCryptoList()
    }
    
    private func showCryptoList() {
        let cryptoListCoordinator = CryptoListCoordinator(navigationController: navigationController)
        childCoordinators[.cryptolist] = cryptoListCoordinator
        cryptoListCoordinator.delegate = self
        cryptoListCoordinator.start()
    }
    
}

extension AppCoordinator: CryptoListCoordinatorDelegate {
    func listCoordinatorDidFinish() {
        
    }
}
