//
//  CryptoListCellViewModel.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 16/01/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import UIKit

class CryptoListCellViewModel {
    
    let rank : String
    let title : String
    let price : String
    let symbol : String
    let percentChange1 : String
    let colorPercent : UIColor
    
    init(item: CryptoCurrency) {
        rank = item.rank
        title = item.name
        price = item.priceUsd.normalizeQuantityWithTwoDecimals()
        symbol = item.symbol
        percentChange1 = item.percentChange1h.getNormalizedPercentage()
        colorPercent = UIColor.getColor(percengateNumber: item.percentChange1h)
    }
}

