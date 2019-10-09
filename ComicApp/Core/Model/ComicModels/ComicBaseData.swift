//
//  ComicBaseData.swift
//  ComicApp
//
//  Created by Phil Martin on 09/10/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import Foundation
struct ComicBaseData: Codable {
    
    let responseCode: Int?
    let apiDataSource: ComicBookDataSource?
    
    enum CodingKeys: String, CodingKey{
        case responseCode = "code"
        case apiDataSource = "data"
    }
}
