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
    
    //--------------------------------------------------------------------------

    func chooseCard( at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
        
        
    }
    
    //--------------------------------------------------------------------------

    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards  {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards...
    }
    
    //--------------------------------------------------------------------------

    
}
