//
//  CryptoListTableViewCell.swift
//  CryptoCompare
//
//  Created by Juan Miguel Marques Morilla on 16/01/2019.
//  Copyright © 2019 Juan Miguel Marques Morilla. All rights reserved.
//

import UIKit

class CryptoListTableViewCell: UITableViewCell {
    
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var viewPercentage: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setup (viewModel: CryptoListCellViewModel?){
        rankLabel?.text = viewModel?.rank
        nameLabel?.text = viewModel?.title
        valueLabel?.text = viewModel?.price
        symbolLabel?.text = viewModel?.symbol
        percentageLabel?.text = viewModel?.percentChange1
        viewPercentage?.backgroundColor = viewModel?.colorPercent
    }
}
