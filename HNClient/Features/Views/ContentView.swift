//
//  ContentView.swift
//  HNClient
//
//  Created by Paolo Baeli on 14/07/22.
//

import SwiftUI
import PagerTabStripView

struct ContentView: View {

    @State private var selection = 1
    @StateObject private var vm = StoryViewModelImpl()
    
    var body: some View {
            TabView(selection: $selection) {
                ModularTabView(storySource: .newStories, tabPageTitle: "New stories").environmentObject(vm)
                    .tabItem {
                        Image(systemName: "newspaper")
                        Text("New")
                    }
                ModularTabView(storySource: .topStories, tabPageTitle: "Top stories").environmentObject(vm)
                    .tabItem {
                        Image(systemName: "arrow.up")
                        Text("Top")
                    }
                ModularTabView(storySource: .bestStories, tabPageTitle: "Best stories").environmentObject(vm)
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
