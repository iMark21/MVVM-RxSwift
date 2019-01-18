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

class CryptoListViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var viewModel : CryptoListViewModel?
    var cellViewModels : [CryptoListCellViewModel] = []
    let loadingViewController = LoadingViewController()
    let errorViewController = ErrorViewController()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupViewModel()
        requestData()
    }
    
    func configureView (){
        self.title = "Market"
        configureTableView()
    }
    
    func configureTableView(){
        tableView.register(UINib(nibName: "CryptoListTableViewCell", bundle: nil), forCellReuseIdentifier: "CryptoListTableViewCell")
    }
    
    func requestData () {
        //Request data
        guard let vm = viewModel else {return}
        vm.requestData()
    }
    
    func setupViewModel() {

        guard let vm = viewModel else {return}
        let state = vm.state.asObservable()
        
        state.subscribe(onNext: { (state) in
            switch state{
            case .loaded(let cellViewModels):
                self.cellViewModels = cellViewModels
                self.tableView.reloadData()
                self.errorViewController.remove()
                self.loadingViewController.remove()
                break
            case .loading:
                self.errorViewController.remove()
                self.add(child: self.loadingViewController)
                break
            case .error:
                self.loadingViewController.remove()
                self.add(child: self.errorViewController)
                break
            }
        }).disposed(by: disposeBag)
        
        //Manage error view
        errorViewController.reloadDataAction.asObservable()
            .subscribe(onNext: { (request) in
                if request {
                    vm.requestData()
                }
            }, onCompleted: {
                self.errorViewController.reloadDataAction.accept(false)
            }).disposed(by: disposeBag)
    }
    
}

extension CryptoListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoListTableViewCell", for: indexPath)
        if let cell = cell as? CryptoListTableViewCell{
            let rowViewModel = cellViewModels[indexPath.row]
            cell.setup(viewModel: rowViewModel)
        }
        return cell
    }
    
}
