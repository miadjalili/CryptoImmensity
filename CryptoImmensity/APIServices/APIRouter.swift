//
//  APIRouter.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/23/21.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case Coins(currency: String)
    case Exchanges
    case markets(coinId: String)
    case Tickers(exchange:String ,pair: String)
    case Fiats
    case news
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case  .Coins,.Exchanges,.markets,.Tickers,.Fiats,.news:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .Coins:
            return "/coins"
        case .Exchanges:
            return "/exchanges"
        case.markets:
            return "/markets"
        case.Tickers:
            return "/tickers"
        case .Fiats:
            return"/fiats"
        case .news:
            return "/news"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .Coins(let currency):
            return [API.APIParameterKey.currency: currency]
        case .markets(let coinID):
            return [API.APIParameterKey.coinId: coinID]
        case .Tickers(let exchange,let pair):
        return[API.APIParameterKey.exchange: exchange,API.APIParameterKey.pair: pair]
        default:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
      
        var url = try API.ProductionServer.baseURL.asURL()
        switch self {
        case .Exchanges:
            url =  try API.ProductionServer.baseURL2.asURL()
        default:
            url =  try API.ProductionServer.baseURL.asURL()
        }
        
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
 
        // Parameters
        if let parameters = parameters {
            do {
                if method == .get {
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                   
                }else{
                
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                }
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        print(urlRequest)
        return urlRequest
    }
}
