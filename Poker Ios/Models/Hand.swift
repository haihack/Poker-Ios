//
//  Meal.swift
//  FoodTracker
//
//  Created by Chu Hoang Hai on 2020/11/30.
//

import UIKit

class Hand {
    
    //MARK: Properties
    var cards: [Card] = []
    
    //MARK: Initialization
    init() {
        for i in 0 ..< 5 {
            cards += [Card(name: "")]
        }
    }
    
    public func getFullHand() -> String{
        var ret = ""
        for i in 0 ..< 4 {
            ret += cards[i].name + " "
        }
        ret += cards[4].name
        return ret
    }
    
}
