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

class CryptoListViewModel: BaseViewModel{
    
    var data = Variable<[CryptoCurrency]>([])
    
    func requestData(){
        RxAlamofire.requestJSON(.get, Constants.API.baseUrl + Constants.API.Version.v1 + Constants.API.EndPoint.allTicker)
            .do(onSubscribe: { [weak self] in
                self?.isLoading.value = true
            })
            .subscribe(onNext: { (_, json) in
                if let dict = json as? [[String: Any]] {
                    let data = Mapper<CryptoCurrency>().mapArray(JSONArray: dict)
                    self.data.value = data
                    self.isLoading.value = false
                }
        },onError: { (error) in
            self.isLoading.value = false
            self.error.value = true
        }).disposed(by: disposeBag)
    }
    
}
