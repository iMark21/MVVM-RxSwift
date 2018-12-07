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
    
    //var data = Variable<[Currency]>([])
    
    func requestData(){
        RxAlamofire.requestJSON(.get, "").subscribe(onNext: { (json) in
            
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }).disposed(by: disposeBag)
        
        
//        RxAlamofire.requestJSON(.get, C.API.URLString)
//            .subscribe(onNext: { (r, json) in
//                if let dict = json as? [[String: Any]] {
//                    let data = Mapper<Currency>().mapArray(JSONArray: dict)
//                    self.data.value = data
//                }
//            }, onError: { (error) in
//                print(error)
//            }).disposed(by: disposeBag)
    }
    
}
