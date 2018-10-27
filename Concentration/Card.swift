//
//  Card.swift
//  Concentration
//
//  Created by Peter Harding on 27/10/18.
//  Copyright © 2018 Magus Consulting. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int

    static var identifierFactory = 0
    
    //--------------------------------------------------------------------------
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
    //--------------------------------------------------------------------------
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    //--------------------------------------------------------------------------

    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    //--------------------------------------------------------------------------
}
