//
//  DatabaseSpec.swift
//  Poker IosTests
//
//  Created by Chu Hoang Hai on 2020/12/09.
//

import UIKit
import Quick
import Nimble
import RealmSwift

class DatabaseSpec: QuickSpec {

    override func spec() {
        super.spec()

        beforeSuite {
          Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        }
        
        beforeEach {
              let realm = try! Realm()
              try! realm.write {
                realm.deleteAll()
              }
            }
        
      }

}
