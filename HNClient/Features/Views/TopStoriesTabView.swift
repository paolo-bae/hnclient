//
//  TopStoriesTabView.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import SwiftUI

struct TopStoriesTabView: View {
    @State private var storySource: StorySource = .topStories
    @State private var selectedStory: Story?
    
    @EnvironmentObject var vm: StoryViewModelImpl
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.stories) { story in
                    Button {
                        selectedStory = story
                    } label: {
                        StoryView(story: story)
                    }
                }
            }
            .navigationTitle("Top stories")
            .task {
                await vm.getStories(from: storySource)
            }
            .refreshable {
                //MARK: Remove all entries when pulling the list
                    vm.updateStories()
                //MARK: Call API for repopulate an updated list
                    await vm.getStories(from: storySource)
            }
        }
    }
}

struct TopStoriesTabView_Previews: PreviewProvider {
    static var previews: some View {
        TopStoriesTabView()
    }
}
