//
//  Response.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/07.
//

import Foundation

class Response: Codable {
    var result: [HandResponse]
    var error: [ErrorResponse]
    
    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        let result = try container.decodeIfPresent([HandResponse].self, forKey: .result) ?? [HandResponse]()
        self.result = result

        let error = try container.decodeIfPresent([ErrorResponse].self, forKey: .error) ?? [ErrorResponse]()
        self.error = error
    }
}
