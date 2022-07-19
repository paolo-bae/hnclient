//
//  ModularTabView.swift
//  HNClient
//
//  Created by Paolo Baeli on 19/07/22.
//

import SwiftUI

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}

struct ModularTabView: View {
    @State private var selectedStoryUrl: URL?
    @State var storySource: StorySource
    @State var tabPageTitle: String
    @State var showArticle: Bool = false
    @State var showLoadingArticle: Bool = false
    @State var listAlreadyLoaded: Bool = false
    @EnvironmentObject var vm: StoryViewModelImpl
    
    var body: some View {
        NavigationView {
            
            Group {
                    List(vm.stories, id: \.id) { story in
                        //ForEach(vm.stories, id: \.id) { story in
                        NavigationLink(destination: StoryArticleWebView(url: URL(string: story.url)!, loading: $showLoadingArticle), label: {
                            StoryView(story: story)
                        })
                        //}
                    }
                    .navigationTitle(tabPageTitle)
                    .task {
                        //MARK: Call API Request to fill an updated list
                        await vm.getStories(from: storySource)
                    }
                    .refreshable {
                        //MARK: Call API Request for resetting and repopulating an updated list
                        await vm.getStories(from: storySource)
                    }
                }
            }
        }
    }

struct ModularTabView_Previews: PreviewProvider {
    static var previews: some View {
        ModularTabView(storySource: .newStories, tabPageTitle: "New stories").environmentObject(StoryViewModelImpl())
    }
}
