//
//  TableViewCellNews.swift
//  CryptoImmensity
//
//  Created by miadjalili on 2/2/22.
//

import UIKit

class TableViewCellNews: UITableViewCell {

    static let identifier = "NewsCellIden"
    static let name = "TableViewCellNews"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
}
