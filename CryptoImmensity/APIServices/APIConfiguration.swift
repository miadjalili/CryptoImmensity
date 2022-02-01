//
//  APIConfiguration.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/23/21.
//

import Foundation
import Alamofire


protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
