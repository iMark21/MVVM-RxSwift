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



enum State {
    case loading
    case error
    case loaded (BehaviorRelay<[CryptoCurrency]>)
}


class CryptoListViewModel {
    
    private let disposeBag = DisposeBag()
    private var data = BehaviorRelay<[CryptoCurrency]>(value: [])

    //input
    private var repository : CMCRepository
    
    //output
    var state  = PublishSubject<State>()

    init(repository : CMCRepository) {
        self.repository = repository
    }

    func requestData(){
        state.onNext(.loading)
        repository.getCryptoCurrencies().asObservable()
            .flatMap({ (_, json) -> BehaviorRelay<[CryptoCurrency]> in
                if let dict = json as? [[String: Any]] {
                    let data = Mapper<CryptoCurrency>().mapArray(JSONArray: dict)
                    self.data.accept(data)
                }
                return self.data
            }).subscribe(onNext: { (list) in
                self.state.onNext(.loaded(BehaviorRelay.init(value: list)))
            }, onError: { (error) in
                self.state.onNext(.error)
            }, onCompleted: {
                self.state.onNext(.loaded(self.data))
            }).disposed(by: disposeBag)
    }

}
