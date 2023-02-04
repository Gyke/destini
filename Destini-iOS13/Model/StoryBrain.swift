//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    var currentStory: Story
    
    let deadEndStory = Story(title: "Congratulations! You are lucky!")
    let goodEndStory = Story(title: "Game over! You are dead!")

    var isGameOver = false
    
    init() {
        var secondStory = Story(title: "You see a tiger")
            secondStory.setChoice(choice: "Shout for help", story: goodEndStory)
            secondStory.setChoice(choice: "Play dead", story: deadEndStory)
        
        var thirdStory = Story(title: "You find a treasure chest")
            thirdStory.setChoice(choice: "Open it", story: deadEndStory)
            thirdStory.setChoice(choice: "Check for traps", story: goodEndStory)
        
        currentStory = Story(title: "You see a fork in the road")
        currentStory.setChoice(choice: "Take a left", story: secondStory)
        currentStory.setChoice(choice: "Take a right", story: thirdStory)
    }

    mutating func nextStory(_ choice: String) {
        if let cs = currentStory.getStory(by: choice) {
            currentStory = cs
        } else {
            currentStory = goodEndStory
            isGameOver = true
        }
    }
}
