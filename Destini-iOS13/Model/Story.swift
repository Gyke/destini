//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let title: String
    var choices: [String: Story] = [:]
    
    init(title: String) {
        self.title = title
    }
    
    mutating func setChoice(choice: String, story: Story) {
        choices[choice] = story
    }
    
    func getStory(by choice: String) -> Story? {
        return choices[choice]
    }
    
}
