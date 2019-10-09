//
//  ComicBookDataSource.swift
//  ComicApp
//
//  Created by Phil Martin on 09/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import Foundation

struct ComicBookDataSource : Codable {
    let comics: [Comic]?
    
    enum CodingKeys: String, CodingKey{
        case comics = "results"
    }
//
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        comics = try values.decodeIfPresent([Comic].self, forKey: .comics)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encodeIfPresent(self.comics, forKey: .comics)
    }
    
}
