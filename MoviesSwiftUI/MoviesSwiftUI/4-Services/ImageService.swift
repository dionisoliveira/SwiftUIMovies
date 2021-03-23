//
//  ImageHelper.swift
//  MoviesSwiftUI
//
//  Created by Dionis Silva on 17/03/21.
//

import UIKit
import Combine
import SwiftUI

public enum ImageError:Error {

}

class ImageService: ImageServiceProtocol {
    
    func fechImage<T>(_ uri: String, completionHandler: @escaping (Result<T,ImageError>) -> Void) where T : Decodable {
        if let uriWithAction = URL(string: uri){
          
            URLSession.shared.dataTask(with:  uriWithAction) { data, response, error in
               if let error = error {
                   print(error.localizedDescription)
                
                   return
               }
               
               if let data = data{
                   do {
                       
                       let response = data as! T;
                        completionHandler( .success(response))

                   }
               }
               else{
                let response = data as! T;
                 completionHandler( .success(response))
               }
               
               
           }.resume()
        }
    }
}
