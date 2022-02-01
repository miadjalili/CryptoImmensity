//
//  TableViewCellHomeViewModel.swift
//  CryptoImmensity
//
//  Created by miadjalili on 1/15/22.
//

import Foundation

struct TableViewCellHomeViewModel {
    let id: String
    let icon: String
    let name: String
    let rank: Int
    let price: Double
    
    init (with Coins : Coin ) {
        id    = Coins.id
        icon  = Coins.icon
        name  = Coins.name
        rank  = Coins.rank
        price = Coins.price
    }
}
