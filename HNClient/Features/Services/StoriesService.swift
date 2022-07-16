//
//  StoriesService.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import Foundation

protocol StoriesService {
    func fetch() async throws -> [Story]
}

protocol StoriesIDsService {
    func fetchIDs(_ type: StoryType) async throws -> [Int]
}

final class StoriesIDServiceImpl: StoriesIDsService {
    
    func fetchIDs(_ type: StoryType) async throws -> [Int] {
        var appendToUrl: String = ""
        let urlSession = URLSession.shared
        
        switch type {
        case .newStories:
            appendToUrl = "/newstories.json"
            break
        case .bestStories:
            appendToUrl = "/beststories.json"
            break
        case .topStories:
            appendToUrl = "/topstories.jsno"
            break
        }
        
        let url = URL(string: APIConstatants.baseUrl.appending(appendToUrl))
        let (data, _) = try await urlSession.data(from: url!)
        
        return try JSONDecoder().decode([Int].self, from: data)
    }
    
}
