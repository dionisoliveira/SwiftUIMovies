//
//  HttpHelperProtocol.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 10/03/21.
//

import Foundation

protocol HttpHelperProtocol {
    
    func Get<T:Codable>(_ endpoint: String,
                params: [String: String]?,
                completionHandler:  @escaping (Result<T, HttpError>) -> Void) 
}
