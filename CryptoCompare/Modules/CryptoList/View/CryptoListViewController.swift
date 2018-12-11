//
//  CryptoListViewController.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 07/12/2018.
//  Copyright © 2018 Juan Miguel Marques Morilla. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import PKHUD

class CryptoListViewController: BaseViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var viewModel : CryptoListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    override func setupViewModel() {
        super.setupViewModel()
        
        if let vm = viewModel{
            let isLoading = vm.isLoading.asObservable()
            let error = vm.error.asObservable()
            
            isLoading.subscribe(onNext: { (loading) in
                self.setLoadingHud(visible: loading)
                print ("show mega loading")
            }).disposed(by: disposeBag)
            
            error.subscribe(onNext: { (error) in
                let action = AlertAction(buttonTitle: "ok", handler: {
                    vm.requestData()
                })
                let alert = SingleButtonAlert(title: "", message: "", action: action)
                self.setShowError(alert: alert)
                print ("show mega error")
            }).disposed(by: disposeBag)
            
            vm.data.asObservable()
                .bind(to: tableView.rx.items(cellIdentifier: "UITableViewCell", cellType: UITableViewCell.self)) {
                    (row, crypto, cell) in
                    print ("show \(String(describing: crypto.name))")
                    cell.backgroundColor = UIColor.yellow
                    cell.textLabel?.text = crypto.name
                    cell.detailTextLabel?.text = crypto.priceUsd
                }.disposed(by: disposeBag)
            
            vm.requestData()
            
            tableView.rx
                .modelSelected(CryptoCurrency.self)
                .subscribe(onNext: { (value) in
                    print ("show next \(String(describing: value.name))")
                }).disposed(by: disposeBag)

        }
    }
    
}
