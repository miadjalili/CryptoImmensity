//
//  GetTickers.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/26/21.
//

import Foundation

struct ElementTicker: Codable {
    let tickers: [Ticker]
}

// MARK: - Ticker
struct Ticker: Codable {
    let from, to, exchange: String
    let price: Double
}
