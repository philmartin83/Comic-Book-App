//
//  RequestHandler.swift
//  ComicBookApp
//
//  Created by Philip Martin on 30/10/2019.
//  Copyright © 2019 Philip Martin. All rights reserved.
//

import Foundation

class RequestHandler{
    private let baseURL = "https://gateway.marvel.com"
    
    func getCharacters() -> URLRequest{
        let endpoint = "/v1/public/characters"
        let url = baseURL + endpoint + buildQueryString()
        
        let request = URLRequest(url: URL(string: url)!)
        return request
        
    }
    
    func getComics(id: Int) -> URLRequest{
        // https://gateway.marvel.com/v1/public/characters/1011334/comics
        let endpoint = "/v1/public/characters/\(id)/comics"
        let url = baseURL + endpoint + buildQueryString()
        
        let request = URLRequest(url: URL(string: url)!)
        return request
        
    }
    
    private func buildQueryString() -> String{
        let timeStamp = Date().timeIntervalSince1970
        
        let queryString = "?ts=\(timeStamp)&apikey=\(publicKey)&hash=\(buildHashToken(timestamp: timeStamp))"
        return queryString
    }
    
    private func buildHashToken(timestamp: TimeInterval) -> String{
        let unhashedString = "\(timestamp)" + privateKey + publicKey
        return MD5(str: unhashedString)
    }
}
