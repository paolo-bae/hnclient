//
//  ContentView.swift
//  HNClient
//
//  Created by Paolo Baeli on 14/07/22.
//

import SwiftUI
import PagerTabStripView

struct ContentView: View {
    @State private var storySource: StorySource = .newStories
    @State private var stories = [Story]()
    @State private var selection = 1
    @StateObject private var vm = StoryViewModelImpl()
    
    var body: some View {
            TabView(selection: $selection) {
                NewStoriesTabView().environmentObject(vm)
                    .tabItem {
                        Image(systemName: "newspaper")
                        Text("New")
                    }
                TopStoriesTabView().environmentObject(vm)
                    .tabItem {
                        Image(systemName: "arrow.up")
                        Text("Top")
                    }
                BestStroriesTabView().environmentObject(vm)
                    .tabItem {
                        Image(systemName: "star")
                        Text("Best")
                    }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
