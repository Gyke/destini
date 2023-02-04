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
    
    var storyBrain = StoryBrain()
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons += [choice1Button, choice2Button]
        setUI()
    }
    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        storyBrain.nextStory(sender.currentTitle!)
        setUI()
    }
    
    func setUI() {
        storyLabel.text = storyBrain.currentStory.title
        if storyBrain.isGameOver() {
            buttons.forEach({ $0.isHidden = true })
            return
        }
        for (i, choice) in storyBrain.currentStory.choices.enumerated() {
            buttons[i].setTitle(choice.key, for: .normal)
        }
    }
}
