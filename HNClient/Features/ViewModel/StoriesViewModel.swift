//
//  ViewModel.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import Foundation
import SwiftUI
import Combine

public enum StorySource: String, CaseIterable, Codable {
    case newStories = "New Stories"
    case topStories = "Top Stories"
    case bestStories = "Best Stories"
    
    func endPointConversion() -> EndPoint {
        switch self {
        case .newStories:
            return .newStories
        case .topStories:
            return .topStories
        case .bestStories:
            return .bestStories
        }
    }
}

protocol StoryViewModel: ObservableObject {
    func getStories(from storySource: StorySource) async
}

@MainActor
final class StoryViewModelImpl: StoryViewModel {
    
    let api = StoriesServiceImpl()
    @Published private(set) var storiesIDs: [Int] = []
    @Published private(set) var stories: [Story] = []
    
    init() {
        
    }
    
    func getStories(from storySource: StorySource) async {
        
        stories.removeAll()
        storiesIDs.removeAll()
        
        do {
            self.storiesIDs = try await api.fetchIDs(endPoint: storySource.endPointConversion().url)
            
            for storyID in storiesIDs {
                do {
                    let story = try await api.fetchStory(endPoint: EndPoint.story(storyID).url)
                    self.stories.append(story)
                } catch {
                    print(error)
                }
            }
        } catch {
            print(error)
        }
        
    }
    
}
