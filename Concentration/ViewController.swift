//
//  ViewController.swift
//  Concentration
//
//  Created by Baraa Hesham on 12/1/18.
//  Copyright © 2018 Baraa Hesham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojis = ["👻","🤡","☠️","🏀","😍","😎","🐒","🐼"]
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.index(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }
    
    func updateViewFromModel(){
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
    
    var emoji = [Int:String]()
    
    func emoji(for card : Card) -> String {
        if emoji[card.identifier] == nil, emojis.count > 0{
                let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
                emoji[card.identifier] = emojis.remove(at: randomIndex)

        }
        return emoji[card.identifier] ?? "?"
    }
    
}

