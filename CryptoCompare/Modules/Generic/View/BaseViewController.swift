//
//  GenericViewController.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 07/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit
import PKHUD
import RxSwift
import RxCocoa

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}

class BaseViewController: UIViewController, BaseViewProtocol {
    
    private var state : Observable<State>
    var disposeBag = DisposeBag()
    
    //Input
    var reloadDataAction = BehaviorRelay<Bool>(value: false)
    
    init(state: Observable<State>) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStateView()
    }
    
    private func setLoadingHud(visible:Bool){
        PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
        visible ? PKHUD.sharedHUD.show(onView: view) : PKHUD.sharedHUD.hide()
    }
    
    private func setShowError(alert:SingleButtonAlert) {
        let alertController = UIAlertController(title: alert.title,
                                                message: alert.message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alert.action.buttonTitle,
                                                style: .default,
                                                handler: { _ in alert.action.handler?() }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func showStateView(){
        state.subscribe(onNext: { (result) in
            switch result {
            case .loading:
                self.setLoadingHud(visible: true)
                break
            case .error:
                self.setLoadingHud(visible: false)
                let action = AlertAction(buttonTitle: "ok", handler: {
                    self.reloadDataAction.accept(true)
                })
                let alert = SingleButtonAlert(title: "Oops!", message: "Problems", action: action)
                print ("show mega error")
                self.setShowError(alert: alert)
                break
            case .completed:
                self.setLoadingHud(visible: false)
                break
            }
        }).disposed(by: disposeBag)
    }
    
}
