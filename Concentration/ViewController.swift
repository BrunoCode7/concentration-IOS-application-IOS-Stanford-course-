//
//  ViewController.swift
//  Concentration
//
//  Created by Baraa Hesham on 12/1/18.
//  Copyright © 2018 Baraa Hesham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards : Int {
        get{
            return  cardButtons.count / 2
        }
    }
    
    private(set) var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    private var emojis = ["👻","🤡","☠️","🏀","😍","😎","🐒","🐼"]
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.index(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp{
                button.setTitle(emoji(for : card), for: UIControl.State.normal)
                button.backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emoji = [Int:String]()
    
    private func emoji(for card : Card) -> String {
        if emoji[card.identifier] == nil, emojis.count > 0{

                emoji[card.identifier] = emojis.remove(at: emojis.count.arc4random)

        }
        return emoji[card.identifier] ?? "?"
    }
    
}
extension Int{
    var arc4random: Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))}
        else if self < 0{
            return -Int(arc4random_uniform(UInt32(self)))
        }else{
            return 0
        }
    }
}

