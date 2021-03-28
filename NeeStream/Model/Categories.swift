//
//  Categories.swift
//  NeeStream
//
//  Created by shahid panchily on 27/03/21.
//

import Foundation

struct Categories: Decodable {
    
    var name:  String?
    var media: [Media]?
    
    enum Codingkeys: String, CodingKey {
        case name = "name"
        case media = "media"
        
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.media = try container.decode([Media].self, forKey: .media)
        
    }
    
}
