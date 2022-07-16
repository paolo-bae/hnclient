//
//  ContentView.swift
//  HNClient
//
//  Created by Paolo Baeli on 14/07/22.
//

import SwiftUI
import PagerTabStripView

struct ContentView: View {
    @State private var stories = [Story]()
    @State private var selection = 1
    
    var body: some View {
            TabView(selection: $selection) {
                NewStoriesTabView()
                    .tabItem {
                        Image(systemName: "newspaper")
                        Text("New")
                    }
                TopStoriesTabView()
                    .tabItem {
                        Image(systemName: "arrow.up")
                        Text("Top")
                    }
                BestStroriesTabView()
                    .tabItem {
                        Image(systemName: "star")
                        Text("Best")
                    }
            }
            .onAppear() {
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
