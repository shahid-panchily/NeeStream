//
//  Response.swift
//  NeeStream
//
//  Created by shahid panchily on 27/03/21.
//

import Foundation

struct Response: Decodable {
    
    var categories: [Categories]?
    
    enum Codingkeys: String, CodingKey {
        
        case mediaObject = "mediaObject"
        case categories = "categories"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        
        let mediaContainer = try container.nestedContainer(keyedBy: Codingkeys.self, forKey: .mediaObject)
        self.categories =  try mediaContainer.decode([Categories].self, forKey:.categories)
    }
}
