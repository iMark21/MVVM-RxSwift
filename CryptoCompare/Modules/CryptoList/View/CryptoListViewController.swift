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
            
            let state = vm.state.asObservable()
            self.setStateView(state: state)
            
            reloadDataAction.asObservable().subscribe(onNext: { (request) in
                vm.requestData()
            }, onCompleted: {
                self.reloadDataAction.accept(false)
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
