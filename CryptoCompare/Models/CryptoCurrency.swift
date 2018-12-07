//
//  CryptoCurrency.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 07/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit
import ObjectMapper

class CryptoCurrency: Mappable {
    
    var id:String!
    var name:String!
    var symbol:String!
    var priceUsd:String!
    var lastUpdated:Date!
    var percentChange1h:String!
    
    var isChangePositive:Bool{
        return Double(percentChange1h)! > 0
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        symbol              <- map["symbol"]
        priceUsd            <- map["price_usd"]
        percentChange1h     <- map["percent_change_1h"]
        lastUpdated         <- (map["last_updated"], DateTransform())
    }

}
