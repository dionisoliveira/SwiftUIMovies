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
    
   
    let decoder = JSONDecoder()
    
    //Generic handler
    func Get<T :Codable>(_ endpoint: Endpoint,
            
                completionHandler:  @escaping (Result<T, HttpError>) -> Void) {
        
        guard let url = endpoint.url else {
            return completionHandler(.failure(.noResponse))
                }

           URLSession.shared.dataTask(with: url) { data, response, error in
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
