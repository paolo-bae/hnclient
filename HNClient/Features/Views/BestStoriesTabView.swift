//
//  BestStroriesTabView.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import SwiftUI

struct BestStroriesTabView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Story.dummyStories, id: \.id) { item in
                    StoryView(item: item)
                    }
            }
            .navigationTitle("Best stories")
        }
    }
}

struct BestStroriesTabView_Previews: PreviewProvider {
    static var previews: some View {
        BestStroriesTabView()
    }
}
