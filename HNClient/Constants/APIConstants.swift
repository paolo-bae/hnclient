//
//  APIConstants.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import Foundation

enum APIConstants {
    static var baseUrl = URL(string: "https://hacker-news.firebaseio.com/v0")!
}

enum EndPoint {
    
    case story(Int)
    case newStories
    case topStories
    case bestStories
    
    var url: URL {
        switch self {
        case .story(let id):
            return APIConstants.baseUrl.appendingPathComponent("/item/\(id).json")
        case .newStories:
            return APIConstants.baseUrl.appendingPathComponent("/newstories.json")
        case .topStories:
            return APIConstants.baseUrl.appendingPathComponent("/topstories.json")
        case .bestStories:
            return APIConstants.baseUrl.appendingPathComponent("/beststories.json")
        }
    }
}
