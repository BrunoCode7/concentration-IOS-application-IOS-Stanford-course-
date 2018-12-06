//
//  Concentration.swift
//  Concentration
//
//  Created by Baraa Hesham on 12/3/18.
//  Copyright © 2018 Baraa Hesham. All rights reserved.
//

import Foundation
class Concentration {
    
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard:Int? {
        get{
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].isFacedUp{
                    if foundIndex==nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier==cards[index].identifier{
                //check if cards match
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            cards[index].isFacedUp = true
        }else{
                //either no cards or 2 cards are faced up
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
