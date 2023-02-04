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

    var gameOver = false
    
    init() {
        currentStory = Story(title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide-brimmed hat and soulless eyes opens the passenger door for you and says: 'Need a ride, boy?'.")
        var story_01 = Story(title: "He nods slowly, unphased by the question.")
        var story_02 = Story(title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.")
        let story_03 = Story(title: "What? Such a cop-out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?")
        let story_04 = Story(title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.")
        let story_05 = Story(title: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'")

        
        story_01.setChoice(choice: "Wait, I know how to change a tire.", story: story_03)
        
        story_02.setChoice(choice: "I love Elton John! Hand him the cassette tape.", story: story_05)
        story_02.setChoice(choice: "It’s him or me. Take the knife and stab him.", story: story_04)
        
        story_01.setChoice(choice: "At least he's honest. I'll climb in.", story: story_02)

        currentStory.setChoice(choice: "I'll hop in. Thanks for the help!", story: story_02)
        currentStory.setChoice(choice: "Well, I don't have many options. Better ask him if he's a murderer", story: story_01)
    }

    mutating func nextStory(_ choice: String) {
        if let cs = currentStory.getStory(by: choice) {
            currentStory = cs
        } else {
            currentStory = goodEndStory
            gameOver = true
        }
    }
    func isGameOver() -> Bool {
        return gameOver || currentStory.choices.count == 0
    }
}
