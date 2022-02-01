//
//  ModelNews.swift
//  CryptoCurrency
//
//  Created by miadjalili on 10/28/21.
//

import Foundation

struct NewsModel: Codable {
    let news: [News]
}


// MARK: - News
struct News: Codable {
    let id: String
    let feedDate: Int
    let source, title, newsDescription: String
    let imgURL: String
    let link, sourceLink: String
    let reactionsCount: [String: Int]
    let shareURL: String
    let relatedCoins: [String]
    let content: Bool
  

    enum CodingKeys: String, CodingKey {
        case id, feedDate, source, title
        case newsDescription = "description"
        case imgURL, link, sourceLink, reactionsCount, shareURL, relatedCoins, content
    }
}


