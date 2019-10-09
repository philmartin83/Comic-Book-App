//
//  CharacterBaseData.swift
//  ComicApp
//
//  Created by Phil Martin on 10/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import Foundation

struct CharacterBaseData: Codable {
    let responseCode: Int?
    let apiDataSource: CharacterDataSource?
    
    enum CodingKeys: String, CodingKey{
        case responseCode = "code"
        case apiDataSource = "data"
    }
}
