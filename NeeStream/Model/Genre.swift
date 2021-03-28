//
//  Genre.swift
//  NeeStream
//
//  Created by shahid panchily on 27/03/21.
//

import Foundation

struct Genre: Decodable {
    var genreName: String?
    var id: Int?
    enum Codingkeys: String, CodingKey {
        case genreName = "name"
        case id = "id"
        
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        self.genreName = try container.decode(String.self, forKey: .genreName)
        self.id = try container.decode(Int.self, forKey: .id)
    }
}
