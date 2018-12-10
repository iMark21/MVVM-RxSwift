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

class CryptoListViewController: GenericViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var viewModel = CryptoListViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    func setupViewModel(){
        viewModel.data.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "UITableViewCell", cellType: UITableViewCell.self)) {
                (row, crypto, cell) in
                cell.textLabel?.text = crypto.name
                cell.detailTextLabel?.text = crypto.priceUsd
            }
            .disposed(by: disposeBag)
        
        viewModel.requestData()
        
        tableView.rx
            .modelSelected(CryptoCurrency.self)
            .subscribe(onNext: { (value) in
                print ("show next \(value)")
            })
            .disposed(by: disposeBag)

    }
    
}
