//
//  BaseViewModel.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 10/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import RxSwift
import RxCocoa

class BaseViewModel{
    
    let disposeBag = DisposeBag()
    let isLoading = BehaviorRelay<Bool>(value:true)
    let error = BehaviorRelay<Bool>(value:false)

    init() {
        
    }
}

