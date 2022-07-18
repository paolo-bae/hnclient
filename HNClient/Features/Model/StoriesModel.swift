//
//  StoryModel.swift
//  HNClient
//
//  Created by Paolo Baeli on 14/07/22.
//

import Foundation

struct Story: Codable, Identifiable {
    //MARK: Define the single story element properties
    let id: Int
    let by: String
    let score: Int
    let title: String
    let url: String
}
    
    //MARK: Just a sample array of stories for test purposes
extension Story {
    static let dummyStories: [Story] = [
        Story(                         id: 6891,
                                       by: "domp",
                                       score: 7,
                                       title: "Vutool: Stealth Startup of a \"Google Earth\" from the ground level",
                                       url: "http://www.techcrunch.com/2007/03/28/whispers-about-stealth-startup-vutool/"),
        Story(                         id: 6891,
                                       by: "domp",
                                       score: 7,
                                       title: "Vutool: Stealth Startup of a \"Google Earth\" from the ground level",
                                       url: "http://www.techcrunch.com/2007/03/28/whispers-about-stealth-startup-vutool/"),
        Story(                         id: 6891,
                                       by: "domp",
                                       score: 7,
                                       title: "Vutool: Stealth Startup of a \"Google Earth\" from the ground level",
                                       url: "http://www.techcrunch.com/2007/03/28/whispers-about-stealth-startup-vutool/"),
        Story(                         id: 6891,
                                       by: "domp",
                                       score: 7,
                                       title: "Vutool: Stealth Startup of a \"Google Earth\" from the ground level",
                                       url: "http://www.techcrunch.com/2007/03/28/whispers-about-stealth-startup-vutool/"),
        Story(                         id: 6891,
                                       by: "domp",
                                       score: 7,
                                       title: "Vutool: Stealth Startup of a \"Google Earth\" from the ground level",
                                       url: "http://www.techcrunch.com/2007/03/28/whispers-about-stealth-startup-vutool/"),
        
        
    ]
}

