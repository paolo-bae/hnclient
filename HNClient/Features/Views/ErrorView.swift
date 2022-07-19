//
//  ErrorView.swift
//  HNClient
//
//  Created by Paolo Baeli on 19/07/22.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    @EnvironmentObject var vm: StoryViewModelImpl
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
/*
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error:)
    }
}*/
