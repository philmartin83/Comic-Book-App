//
//  Character.swift
//  ComicApp
//
//  Created by Phil Martin on 10/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import Foundation

struct Character: Codable {
    let id : Int?
    let name : String?
    let description : String?
    let modified : String?
    let thumbnail : Thumbnail?
    let resourceURI : String?
    let comics : CharacterComics?
}
