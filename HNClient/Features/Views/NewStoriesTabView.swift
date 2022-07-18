//
//  NewStoriesTabView.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import SwiftUI

struct NewStoriesTabView: View {
    @State private var storySource: StorySource = .newStories
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
            .navigationTitle("New stories")
            .task(priority: .high) {
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



struct NewStoriesTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewStoriesTabView()
    }
}
