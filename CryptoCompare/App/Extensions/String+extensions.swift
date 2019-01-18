//
//  String+extensions.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 17/01/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

extension String {
    func normalizePrice() -> String{
        return String(format: "%.2f$", Double((self)) ?? "0.00$")
    }
    
    func normalizedPercentage() -> String {
        return "\(self)" + "%"
    }
}
