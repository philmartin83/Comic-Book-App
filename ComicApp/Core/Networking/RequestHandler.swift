//
//  RequestHandler.swift
//  ComicApp
//
//  Created by Phil Martin on 10/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import Foundation

class RequestHandler{
    let baseURL = "http://gateway.marvel.com"
    let timeout: TimeInterval = 10
    
    func getCharacters() -> URLRequest{
        let endpoint = "/v1/public/characters"
        let timeStamp = Date().timeIntervalSince1970
        let url = baseURL + endpoint + "?" + queryStringForURL(timeStamp: timeStamp)
        print(url)
        let request = URLRequest(url: URL(string: url)!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: timeout)
        return request
    }
    
    private func buildAuthTokenForRequest(timeStamp: TimeInterval) -> String{
        // (ts+private+public)
        let hashThisString = "\(timeStamp)" + privateKey + publicKey
        return MD5(str: hashThisString)
    }
    
    private func queryStringForURL(timeStamp: TimeInterval) -> String{
       return "ts=\(timeStamp)&apikey=\(publicKey)&hash=" + buildAuthTokenForRequest(timeStamp: timeStamp) + "&limit=70"
    }
}
