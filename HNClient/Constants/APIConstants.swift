//
//  APIConstants.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import Foundation

enum APIConstatants {
    static let baseUrl = "https://hacker-news.firebaseio.com/v0"
}

enum StoryType {
    case newStories, topStories, bestStories
}
