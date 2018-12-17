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

class CryptoListViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var viewModel : CryptoListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    func setupViewModel() {

        guard let vm = viewModel else {
            return
        }
        
        let state = vm.state.asObservable()
        
        let baseViewController = BaseViewController.init(state: state)
        add(child: baseViewController)
        
        baseViewController.reloadDataAction.asObservable()
            .subscribe(onNext: { (request) in
                vm.requestData()
            }, onCompleted: {
                baseViewController.reloadDataAction.accept(false)
            }).disposed(by: baseViewController.disposeBag)
        
        
        vm.data.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "UITableViewCell", cellType: UITableViewCell.self)) {
                (row, crypto, cell) in
                print ("show \(String(describing: crypto.name))")
                cell.backgroundColor = UIColor.yellow
                cell.textLabel?.text = crypto.name
                cell.detailTextLabel?.text = crypto.priceUsd
            }.disposed(by: baseViewController.disposeBag)
        
        vm.requestData()
        
        tableView.rx
            .modelSelected(CryptoCurrency.self)
            .subscribe(onNext: { (value) in
                print ("show next \(String(describing: value.name))")
            }).disposed(by: baseViewController.disposeBag)
        
    }
}
