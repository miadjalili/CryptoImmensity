//
//  TableViewCellFiats.swift
//  CryptoImmensity
//
//  Created by miadjalili on 2/1/22.
//

import UIKit

class TableViewCellFiats: UITableViewCell {

    static let identifier = "FiatsCellIden"
    static let name = "TableViewCellFiats"
    
    @IBOutlet weak var imageFiats: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var rateLebel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
}
