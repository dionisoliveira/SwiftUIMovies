//
//  ImageServiceProtocol.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 17/03/21.
//

import Foundation
import  Swift

protocol ImageServiceProtocol {
    
    func fechImage<T:Decodable>(_ uri:String, completionHandler: @escaping (Result<T,ImageError>)  -> Void)
}
