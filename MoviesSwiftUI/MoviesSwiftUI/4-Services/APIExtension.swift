//
//  ExtensionEndPoin.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 23/03/21.
//

import Foundation


let apiKey = "1d9b898a212ea52e283351e521e17871"

extension Endpoint {
   
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
    
   
}





extension Endpoint {
    static func fetchMoviePopular() -> Endpoint {
        return Endpoint(
            path: "/3/movie/popular",
        
            queryItems: [
                URLQueryItem(name: "api_key", value: apiKey),
                URLQueryItem(name: "language", value: Locale.preferredLanguages[0])
            ]
        )
    }
}


