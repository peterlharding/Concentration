//
//  File.swift
//  Concentration
//
//  Created by Peter Harding on 27/10/18.
//  Copyright © 2018 Magus Consulting. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    //--------------------------------------------------------------------------

    func chooseCard( at index: Int) {
        if (!cards[index].isMatched) {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    print("matchIdx \(matchIndex)  index \(index) - \(cards[index].identifier)")
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    //--------------------------------------------------------------------------

    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards  {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards...
        var shuffledCards = [Card]()
        while cards.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            shuffledCards.append(cards.remove(at: randomIndex))
        }
        cards = shuffledCards
    }
    
    //--------------------------------------------------------------------------

    
}
