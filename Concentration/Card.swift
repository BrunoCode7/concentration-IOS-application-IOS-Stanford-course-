//
//  Card.swift
//  Concentration
//
//  Created by Baraa Hesham on 12/3/18.
//  Copyright © 2018 Baraa Hesham. All rights reserved.
//

import Foundation

struct Card{
    
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
