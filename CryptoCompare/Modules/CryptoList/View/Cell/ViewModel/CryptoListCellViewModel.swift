//
//  CryptoListCellViewModel.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 16/01/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation

class CryptoListCellViewModel {
    
    let title : String
    let price : String
    let symbol : String
    let percentChange1 : String
    
    init(item: CryptoCurrency) {
        title = item.name
        price = item.priceUsd
        symbol = item.symbol
        percentChange1 = item.percentChange1h
    }
    
}
