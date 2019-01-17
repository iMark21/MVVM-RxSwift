//
//  CryptoListTableViewCell.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 16/01/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit

class CryptoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageTicker: UIImageView!
    @IBOutlet weak var nameTicker: UILabel!
    @IBOutlet weak var valueTicker: UILabel!
    @IBOutlet weak var valueBtcTicker: UILabel!
    @IBOutlet weak var percentageLastDayTicker: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var viewPercentage: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setup (viewModel: CryptoListCellViewModel?){
        nameTicker?.text = viewModel?.title
        valueTicker?.text = viewModel?.price
        valueBtcTicker?.text = viewModel?.price
        percentageLastDayTicker?.text = viewModel?.percentChange1
    }
}
