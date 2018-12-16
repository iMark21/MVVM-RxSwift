//
//  BaseViewModel.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 10/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import RxSwift
import RxCocoa

enum State {
    case loading
    case error
    case completed
}

class BaseViewModel{
    
    let disposeBag = DisposeBag()
    var state = BehaviorRelay<State>(value: .completed)

    init() {
        
    }
}

