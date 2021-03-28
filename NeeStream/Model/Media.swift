//
//  Media.swift
//  NeeStream
//
//  Created by shahid panchily on 27/03/21.
//

import Foundation

struct Media: Decodable {
    var title: String?
    var isPremium: Bool?
    var logoUrl: String?
    var genre: [Genre]?
    
    enum CodingKeys: String,CodingKey {
        
        case title = "title"
        case isPremium = "isPremium"
        case genre = "genre"
        case logoUrl = "logoUrl"
    
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy:CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
        self.logoUrl = try container.decode(String.self, forKey: .logoUrl)
        self.genre = try container.decode([Genre].self, forKey: .genre)
        
    }
}
