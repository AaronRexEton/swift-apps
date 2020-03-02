//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Aaron Rex on 02/03/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results 
    }
    
}
