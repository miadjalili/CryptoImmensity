//
//  APIClient.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/23/21.
//

import Foundation

import Alamofire

class APIClient {
   
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
       
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
                            
        }
    }
    
    
    ///Get list of coins
    static func GetCoins(currency: String, completion:@escaping (Result<CoinsModel, AFError>)->Void) {
        
        performRequest(route: APIRouter.Coins(currency: currency), completion: completion)
       
    }
    
    
    ///Get list Of Exchanges
    static func GetExchanges(completion:@escaping (Result<ElementExchanges, AFError>)->Void) {
        
        performRequest(route: APIRouter.Exchanges, completion: completion)
       
    }
    
    ///Get list Of Market
    static func GetMarket(coinID: String,completion:@escaping (Result<GetMarkrt, AFError>)->Void) {
        
        performRequest(route: APIRouter.markets(coinId: coinID), completion: completion)
       
    }
    ///Get list Of Market
    static func GetTickers(exchange:String ,pair: String,completion:@escaping (Result<ElementTicker, AFError>)->Void) {
        
        performRequest(route: APIRouter.Tickers(exchange:exchange, pair:pair), completion: completion)
       
    }
    
    ///Get list Of Fiats
    static func GetFiats(completion:@escaping (Result<Fiats, AFError>)->Void) {
        
        performRequest(route: APIRouter.Fiats, completion: completion)
       
    }
    
    ///Get list Of News
    static func GetNews(completion:@escaping (Result<NewsModel, AFError>)->Void) {
        
        performRequest(route: APIRouter.news, completion: completion)
       
    }
    
    
}
