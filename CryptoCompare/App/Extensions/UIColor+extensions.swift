//
//  UIColor+extensions.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 17/01/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func getColor (percengateNumber: String) -> UIColor {
        var color : UIColor = UIColor.red
        let percentage = Double(percengateNumber)
        if ((percentage ?? 0) >= 0) {
            color = UIColor.init(red: 1.0/255.0, green: 153.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        }
        return color
    }
}
