//
//  TableViewCellHome.swift
//  CryptoImmensity
//
//  Created by miadjalili on 12/25/21.
//

import UIKit

class TableViewCellHome: UITableViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    
    
    
    
static let identifier = "HomeCellIden"
    
    
    
    func configure(with ViewModel: TableViewCellHomeViewModel){
        rankLabel.text = "\(ViewModel.rank)"
        coinNameLabel.text = ViewModel.name
        
    }
}
