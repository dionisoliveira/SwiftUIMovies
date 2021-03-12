//
//  HttpHelper.swift
//  Cryptocurrency
//
//  Created by Montreal on 15/02/21.
//

import Foundation
import Swift

public enum HttpError: Error {
    case noResponse
    case jsonDecodingError(error: Error)
    case networkError(error: Error)
}

public struct HttpHelper : HttpHelperProtocol {
    let baseURL = URL(string: "https://api.themoviedb.org/3")!
    let apiKey = "1d9b898a212ea52e283351e521e17871"
    let decoder = JSONDecoder()
    
    //Generic handler
    func Get<T :Codable>(_ endpoint: String,
                params: [String: String]?,
                completionHandler:  @escaping (Result<T, HttpError>) -> Void) {
        let queryURL = baseURL.appendingPathComponent(endpoint)
        var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)!
        
        //Add key security in header of request
        components.queryItems = [
           URLQueryItem(name: "api_key", value: apiKey),
           URLQueryItem(name: "language", value: Locale.preferredLanguages[0])
        ]
        
        if let params = params {
            for (_, value) in params.enumerated() {
                components.queryItems?.append(URLQueryItem(name: value.key, value: value.value))
            }
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
          
           URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.noResponse))
                }
                return
            }
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError(error: error!)))
                }
                return
            }
            do {
                let object = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(object))
                }
            } catch let error {
                DispatchQueue.main.async {
                    #if DEBUG
                    print("JSON Decoding Error: \(error)")
                    #endif
                    completionHandler(.failure(.jsonDecodingError(error: error)))
                }
            }
               
               
           }.resume()
    }
    

    
}
