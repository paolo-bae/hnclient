//
//  StoriesService.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import Foundation

protocol StoriesService {
    //MARK: API call for retrieving a sigle story details by its ID.
    func fetchStory(endPoint: URL) async throws -> [Story]
    
    //MARK: API call for retrieving all the stories of a specified list
    func fetchIDs(endPoint: URL) async throws -> [Int]
}


final class StoriesServiceImpl: StoriesService {
    let urlSession = URLSession.shared
    
    func fetchIDs(endPoint: URL) async throws -> [Int] {
        let (data, _) = try await urlSession.data(from: endPoint)
        return try JSONDecoder().decode([Int].self, from: data)
    }
    
    func fetchStory(endPoint: URL) async throws -> [Story] {
        let (data, _) = try await urlSession.data(from: endPoint)
        return try JSONDecoder().decode([Story].self, from: data)
    }
    
}
