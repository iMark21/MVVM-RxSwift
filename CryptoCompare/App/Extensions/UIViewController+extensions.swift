//
//  UIViewController+extensions.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 17/01/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    func add(child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
