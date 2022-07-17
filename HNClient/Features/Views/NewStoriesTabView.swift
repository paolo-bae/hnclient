//
//  NewStoriesTabView.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import SwiftUI

struct NewStoriesTabView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Story.dummyStories, id: \.id) { item in
                    StoryView(item: item)
                    }
                }
            .navigationTitle("New stories")
            }
            
        }
        
    }


struct NewStoriesTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewStoriesTabView()
    }
}
