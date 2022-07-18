//
//  BestStroriesTabView.swift
//  HNClient
//
//  Created by Paolo Baeli on 15/07/22.
//

import SwiftUI

struct BestStroriesTabView: View {
    @EnvironmentObject var vm: StoryViewModelImpl
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.stories, id: \.id) { item in
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
