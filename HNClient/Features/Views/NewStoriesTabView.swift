//
//  NewStoriesTabView.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import SwiftUI

struct NewStoriesTabView: View {
    @EnvironmentObject var vm: StoryViewModelImpl
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.stories, id: \.id) { item in
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
