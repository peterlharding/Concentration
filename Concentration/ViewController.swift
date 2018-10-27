//
//  ViewController.swift
//  Concentration
//
//  Created by Peter Harding on 26/10/18.
//  Copyright © 2018 Magus Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var faceUp = true;
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCount = 0{
        didSet {
            flipCountLabel.text = "Flips:  \(flipCount)"
        }
    }
    
    // MARK: Start here

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        faceUp = !faceUp
        flipCount += 1
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

