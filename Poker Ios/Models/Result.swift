//
//  Result.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/07.
//

import UIKit

class Result {
    
    internal init(cards: String, rank: String) {
        self.cards = cards
        self.rank = rank
    }
    
    //MARK: Properties
    var cards: String
    var rank: String
    
}

