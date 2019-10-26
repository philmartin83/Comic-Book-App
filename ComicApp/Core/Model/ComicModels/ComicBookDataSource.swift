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
}
