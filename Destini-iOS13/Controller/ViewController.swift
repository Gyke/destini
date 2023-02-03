//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        nextStory()
    }
    
    var storyBrain = StoryBrain()
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        buttons += [choice1Button, choice2Button]
    }
    
    func setUI() {
        let currentStory = storyBrain.getCurrentStory()
        storyLabel.text = currentStory.title
        for (i, button) in buttons.enumerated() {
            button.setTitle(currentStory.choices[i], for: .normal)
        }
    }
    
    func nextStory() {
        storyBrain.increaseStoryNumber()
        if storyBrain.isGameOver() {
            return
        }
        setUI()
    }
}
