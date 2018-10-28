//
//  ViewController.swift
//  Concentration
//
//  Created by Peter Harding on 26/10/18.
//  Copyright © 2018 Magus Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    var faceUp = true;
    var emojiSet = ["🎃","👻","💀","👹","☠️","🦑","🐉","🐲"]
    var emojiChoices = [String]()
    
    var emoji = [Int:String]()
    

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var gameCountLabel: UILabel!
    
    //--------------------------------------------------------------------------

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips:  \(flipCount)"
        }
    }
    //--------------------------------------------------------------------------
    
    var gameCount = 0 {
        didSet {
            gameCountLabel.text = "Games:  \(gameCount)"
        }
    }
    //--------------------------------------------------------------------------

    @IBAction func NewGame(_ sender: UIButton) {
        flipCount = 0
        gameCount += 1
        emojiChoices = emojiSet
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
        updateViewFromModel()
    }
    
    //--------------------------------------------------------------------------
    // MARK: Start here

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
            // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card was not in cardbuttons")
        }
        faceUp = !faceUp
    }

    //--------------------------------------------------------------------------

    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    //--------------------------------------------------------------------------
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    //--------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiChoices = emojiSet
        updateViewFromModel()
        flipCount = 0
        gameCount = 0
    }
    
    //--------------------------------------------------------------------------

}

