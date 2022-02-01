//
//  Constants.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/23/21.
//

import Foundation

struct API {
    struct ProductionServer {
        static let baseURL = "https://api.coinstats.app/public/v1"
        static let baseURL2 = "https://api.coinstats.app/public/v1"
    }
    
    struct APIParameterKey {
        static let currency = "currency"
        static let coinId = "coinId"
        static let exchange = "exchange"
        static let pair = "pair"
        
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
