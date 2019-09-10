//
//  Comics.swift
//  ComicApp
//
//  Created by Phil Martin on 10/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import Foundation

struct Comics : Codable {
    let available : Int?
    let collectionURI : String?
    let items : [SeriesItems]?
    let returned : Int?
}
