//
//  HandResponse.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/07.
//

import Foundation
import RealmSwift

class HandResponse: Object, Codable {
    @objc dynamic var id = 0
    @objc dynamic var card: String = ""
    @objc dynamic var hand: String = ""
    @objc dynamic var time: Int64 = 0
    
    private enum CodingKeys: String, CodingKey {
            case card, hand
        }
    
    func incrementID() -> Int {
           let realm = try! Realm()
           return (realm.objects(HandResponse.self).max(ofProperty: "id") as Int? ?? 0) + 1
       }
}
