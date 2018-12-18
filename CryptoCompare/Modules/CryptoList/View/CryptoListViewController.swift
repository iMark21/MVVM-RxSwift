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
        let disposeBag = DisposeBag()
        let loadingViewController = LoadingViewController()
        let errorViewController = ErrorViewController()

        state.subscribe(onNext: { (state) in
            switch state{
            case .loaded(let data):
                data.asObservable()
                    .bind(to: self.tableView.rx.items(cellIdentifier: "UITableViewCell", cellType: UITableViewCell.self)) {
                        (row, crypto, cell) in
                        print ("show \(String(describing: crypto.name))")
                        cell.backgroundColor = UIColor.yellow
                        cell.textLabel?.text = crypto.name
                        cell.detailTextLabel?.text = crypto.priceUsd
                    }.disposed(by: disposeBag)
                
                self.tableView.rx
                    .modelSelected(CryptoCurrency.self)
                    .subscribe(onNext: { (value) in
                        print ("show next \(String(describing: value.name))")
                    }).disposed(by: disposeBag)
                
                errorViewController.remove()
                loadingViewController.remove()
                break
            case .loading:
                errorViewController.remove()
                self.add(child: loadingViewController)
                break
            case .error:
                loadingViewController.remove()
                self.add(child: errorViewController)
                break
            }
        }).disposed(by: disposeBag)
        
        vm.requestData()
        
        errorViewController.reloadDataAction.asObservable()
            .subscribe(onNext: { (request) in
                if request {
                    vm.requestData()
                }
            }, onCompleted: {
                errorViewController.reloadDataAction.accept(false)
            }).disposed(by: disposeBag)
    }
}
