//
//  CryptoListViewModel.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 07/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire
import ObjectMapper

class CryptoListViewModel{
    
    let disposeBag = DisposeBag()
    
    var data = Variable<[CryptoCurrency]>([])
    
    func requestData(){
        RxAlamofire.requestJSON(.get, Constants.API.baseUrl + Constants.API.Version.v1 + Constants.API.EndPoint.allTicker)
            .subscribe(onNext: { (_, json) in
                if let dict = json as? [[String: Any]] {
                    let data = Mapper<CryptoCurrency>().mapArray(JSONArray: dict)
                    self.data.value = data
                }
        },onError: { (error) in
            
        }).disposed(by: disposeBag)
    }
    
}
