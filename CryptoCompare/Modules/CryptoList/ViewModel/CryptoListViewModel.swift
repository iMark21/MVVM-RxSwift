//
//  CryptoListViewModel.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 07/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper


class CryptoListViewModel: BaseViewModel {
    
    //input
    var repository : CMCRepository
    
    //output
    var data = BehaviorRelay<[CryptoCurrency]>(value: [])

    init(repository : CMCRepository) {
        self.repository = repository
    }

    func requestData(){
        state.accept(.loading)
        repository.getCryptoCurrencies().asObservable()
        .subscribe(onNext: { (_, json) in
            if let dict = json as? [[String: Any]] {
                let data = Mapper<CryptoCurrency>().mapArray(JSONArray: dict)
                self.data.accept(data)
            }
        }, onError: { (error) in
            self.state.accept(.error)
        }, onCompleted: {
            self.state.accept(.completed)
        }).disposed(by: disposeBag)
        
        
        /*
         .flatMap({ (_, json) -> Observable<[CryptoCurrency]> in
         //
         //        })
 */
    }
}
