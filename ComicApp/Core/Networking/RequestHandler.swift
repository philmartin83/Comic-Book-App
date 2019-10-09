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
    let httpGET = "GET"
    let httpPOST = "POST"
    
    func getCharacters() -> URLRequest{
        let endpoint = "/v1/public/characters"
        let timestamp = Date().timeIntervalSince1970
        let url = baseURL + endpoint + "?" + queryStringForURL(timestamp: timestamp, addLimit: true)
        var request = URLRequest(url: URL(string: url)!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: timeout)
        request.httpMethod = httpGET
        print(request)
        return request
    }
    
    func getComics(comicSeries: String) -> URLRequest{
        let timestamp = Date().timeIntervalSince1970
        let url = comicSeries + "?" + queryStringForURL(timestamp: timestamp, addLimit: false)
        var request = URLRequest(url: URL(string: url)!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: timeout)
        request.httpMethod = httpGET
        return request
        
    }
    
    private func buildAuthTokenForRequest(timeStamp: TimeInterval) -> String{
        // (ts+private+public)
        let hashThisString = "\(timeStamp)" + privateKey + publicKey
        return MD5(str: hashThisString)
    }
    
    private func queryStringForURL(timestamp: TimeInterval, addLimit: Bool) -> String{
        var queryString = "ts=\(timestamp)&apikey=\(publicKey)&hash=" + buildAuthTokenForRequest(timeStamp: timestamp)
        if addLimit{
            queryString = queryString + "&limit=70"
        }
        return queryString
    }
}
