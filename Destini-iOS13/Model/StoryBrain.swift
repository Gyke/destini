//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    let stories = [
        Story(title: "Story 0", choices: ["Take a left", "Take a right"]),
        Story(title: "You see a tiger", choices: ["Shout for help", "Play dead"]),
        Story(title: "You find a treasure chest", choices: ["Open it", "Check for traps"]),
    ]
    var currentStory = 0
    
    func getCurrentStory() -> Story {
        return stories[self.currentStory]
    }
    
    mutating func increaseStoryNumber() {
        self.currentStory += 1
    }
    
    func isGameOver() -> Bool {
        return self.currentStory <= self.stories.count - 1 ? false : true
    }
}
