//
//  CMCRepository.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 11/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire


class CMCRepository {
    func getCryptoCurrencies() -> RxSwift.Observable<(HTTPURLResponse, Any)> {
        return RxAlamofire.requestJSON(.get, Constants.API.baseUrl + Constants.API.Version.v1 + Constants.API.EndPoint.allTicker)
    }
}
