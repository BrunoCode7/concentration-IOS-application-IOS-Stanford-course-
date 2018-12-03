//
//  Concentration.swift
//  Concentration
//
//  Created by Baraa Hesham on 12/3/18.
//  Copyright © 2018 Baraa Hesham. All rights reserved.
//

import Foundation
class Concentration {
    
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard:Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier==cards[index].identifier{
                //check if cards match
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFacedUp = true
            indexOfOneAndOnlyFaceUpCard = nil
        }else{
                //either no cards or 2 cards are faced up
            for flipDownIndex in cards.indices{
                cards[flipDownIndex].isFacedUp = false
                
            }
            cards[index].isFacedUp = true
            indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
            
        }
        
        // TODO: Shufle the cards
    }
}
